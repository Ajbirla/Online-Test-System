class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy,:paper]
  before_action :check_user_for_test, only: [:show,:paper]
  # GET /tests
  # GET /tests.json
  def index
    @tests = Test.all
  end
  def paper
    # binding.pry
      session[:test_url] = request.original_url
      @questions = @test.questions.page(params[:page]).per_page(1)
      @answers = @questions.first.answers.where(user_id: current_user.id, test_id: @test)
      @answer=@questions.first.answers.new
        @ques = @test.questions.page(params[:page].to_i - 1).per_page(1) if params[:page].to_i != 0
        if @ques
          @ans = @ques.first.answers.where(user_id: current_user.id, test_id: @test) 
        else
          @ans  = []
        end
       # @ans=Answer.where()
  end
  # GET /tests/1
  # GET /tests/1.json
  def show
     
  end

  # GET /tests/new
  def new
    @test = Test.new

 end

  # POST /tests
  # POST /tests.json
  def create
    @test = Test.new(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: 'Test was successfully created.' }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      # binding.pry
      @test = Test.find(params[:id])
    end

    def check_user_for_test
      @submittedTest=Answer.where(user_id: current_user.id, test_id: @test)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:no_of_questions, :duration, :description, :total_mark, :name,question_ids:[])
    end
end
