class QuestionsController < ApplicationController

  def new
    if !!session[:user_id]
      render 'new'
    else
      flash[:notice] = "You must be logged in to create a question."
      redirect_to root_path
    end
  end

  def create
    # render text: params[:question].inspect
    @question = Question.new(params[:question].merge(asker_id: session[:user_id]) )

    if @question.save
      p @question
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

