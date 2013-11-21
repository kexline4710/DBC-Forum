class QuestionsController < ApplicationController

  def new
  end

  def create
    # render text: params[:question].inspect
    @question = Question.new(params[:question].merge(asker_id: session[:user_id]) )

    if @question.save
      redirect_to root_path
    else
      redirect_to new_question_path
    end
  end

  # def question_params
  #   params.require(:question).permit(:title, :text)
  # end

end

