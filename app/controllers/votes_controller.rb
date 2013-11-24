class VotesController < ApplicationController
  def create

    # Used for redirecting back to the quesiton.
    current_a = Answer.find(params[:answer_id])

    if vote_exist?(params[:answer_id])
      vote = Vote.find_by_answer_id_and_voter_id(params[:answer_id], session[:user_id])
      vote.update(state: params[:vote])
      redirect_to question_path(current_a.question_id)

    else
      Vote.create(answer_id: params[:answer_id], voter_id: session[:user_id], state: params[:vote])
      redirect_to question_path(current_a.question_id)
    end

  end

  def vote_exist?(a)
    Vote.exists?(answer_id: a, voter_id: session[:user_id])
  end
end