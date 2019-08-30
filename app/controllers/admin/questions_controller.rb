class Admin::QuestionsController < ApplicationController
 before_action :set_question, only: [:show, :edit, :update, :destroy]
  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end
  
  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Successfully created question."
      redirect_to admin_questions_path
    else
      render :action => 'new'
    end
  end
  
  def update
    if @question.update(question_params)
      redirect_to [:admin,@question], notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
      redirect_to admin_questions_path, notice: 'Question was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      # params.require(:question).permit(:question, :type, choices_attributes:[:id,:question_id,:choice,:is_correct])
      params.require(:question).permit(:question, :q_type, choices_attributes: Choice.attribute_names.map(&:to_sym).push(:_destroy))
   end
end
