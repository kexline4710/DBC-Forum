class QuestionsController < ApplicationController

  def new
  end

  def create
    render text: params[:question].inspect
  end

end
