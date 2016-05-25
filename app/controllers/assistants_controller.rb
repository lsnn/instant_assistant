class AssistantsController < ApplicationController

  def index
    @tasks = Tasks.all
  end

  def show
    @assistant = Assistant.find_by(assistant_params)
  end

  def new
    @assistant = Assistant.new
  end

  def create
    @assistant = Assistant.new(assistant_params)
    if @assistant.save
      redirect_to index
      # flash message
    else
      # client side validation?
    end
  end

  private

  def assistant_params
    params.require(:assistant).permit(:title, :description)
  end

end
