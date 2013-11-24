class QuestionsController < ApplicationController

  def new
    if session[:user_id]  # doesn't work with current_user method could be bug in controller_spec
      render 'new'
    else
      flash[:error] = "You must be logged in to create a question."
      redirect_to root_path
    end
  end

  def create
    @question = Question.new(params[:question].merge(asker_id: session[:user_id]) )

    if @question.save
      redirect_to question_path(@question)
    else
      redirect_to new_question_path
    end
  end

  def show
    if Question.where("id = ?", params[:id]).length == 0
      redirect_to root_path
    else
      @question = Question.find(params[:id])
    end
  end

  # def question_params
  #   params.require(:question).permit(:title, :text)
  # end

end
