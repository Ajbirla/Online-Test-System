class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy,:paper]
  before_action :check_user_for_test, only: [:show,:paper]
  
  def index
    @tests = Test.all
  end
  def paper
    session[:test_url] = request.original_url
    @questions = @test.questions.page(params[:page]).per_page(1)
    @answer=@questions.first.answers.new
    @ques = @test.questions.page(params[:page].to_i - 1).per_page(1) if params[:page].to_i != 0
    if @ques
      @ans = @ques.first.answers.where(user_id: current_user.id, test_id: @test) 
    else
      @ans  = []
    end
  end
  
  def show
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test, notice: 'Test was successfully created.'
    else
      render :new 
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
