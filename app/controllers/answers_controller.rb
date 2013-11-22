class AnswersController < ApplicationController
  def create
    answer = Answer.create!(body: params[:answer][:body], question_id: params[:question_id], responder_id: current_user.id  )
    redirect_to question_path(params[:question_id])
  end
end
