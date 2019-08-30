class Admin::TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy,:paper,:preview]
  
  # GET /tests
  # GET /tests.json
  def index
    @tests = Test.all
  end
  
  def show
  end

  def preview
  end

  # GET /tests/new
  def new
    @test = Test.new
  end

  # GET /tests/1/edit
  def edit
  end
  
  def create
    total_marks = test_params[:no_of_questions].to_i
    @test = Test.new(test_params)
    @test.total_mark = total_marks
    if @test.save
      redirect_to [:admin,@test], notice: 'Test was successfully created.'
    else
      render :new, notice: 'Test was not created.'
    end
  end

  def update
    if @test.update(test_params)
      redirect_to [:admin,@test], notice: 'Test was successfully updated.'
    else
      render :edit
    end
  end
  def destroy
    @test.destroy
      redirect_to admin_tests_path, notice: 'Test was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

   # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:no_of_questions, :duration, :description, :name, question_ids:[])
    end
end
