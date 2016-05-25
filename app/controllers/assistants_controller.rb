class AssistantsController < ApplicationController

  def show
    @assistant = Assistant.find_by(assistant_params)
  end

  def new
    @assistant = Assistant.new
  end

  def create
    @assistant = Assistant.new(assistant_params)
    if @assistant.save
      flash[:notice] = 'Thank you for signing up as an assistant. You can now choose a task.'
      redirect_to tasks_path
    else
      flash[:danger] = "Your registration didn't get through, please fill in all fields."
      render action: "new"
    end
  end

  private

  def assistant_params
    params.require(:assistant).permit(:full_name, :email, :phone)
  end

end
