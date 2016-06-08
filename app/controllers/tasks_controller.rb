class TasksController < ApplicationController

  before_filter :get_uber_client

  def index
    @tasks = Task.all
    @user = @client.me
  end

  def show
    @task = Task.find_by(task_params)
  end

  def new
    @task = Task.new
  end

  def create
    @user = @client.me
    @task = Task.new(task_params)
    @task.full_name = "#{@user.first_name} #{@user.last_name}"
    @task.email = @user.email
    @task.phone = '081223040'
    if @task.save
      flash[:notice] = 'Thank you for adding a task.'
      redirect_to tasks_path
    else
      flash[:notice] = 'Your task could not be added.'
      redirect_to root_path
      # TODO: client side validation?
    end
  end

  def assign_task
    @assistant = Assistant.first #TODO: get the current logged in assistant
    @task = Task.find(params[:id])
    @task.available = false
    @task.assistant_id = @assistant.id
    if @task.save
      flash[:success] = "This task an now only be completed by you."
      redirect_to tasks_path
    else
      flash[:danger] = "You didn't pick the task up successfully. Try again."
      redirect_to tasks_path
    end
  end

  def cancel_task
    @task = Task.find(params[:id])
    @task.available = true
    @task.assistant_id = nil
    if @task.save
      flash[:success] = "The task is now available to others again."
      redirect_to tasks_path
    else
      flash[:danger] = "You still need to complete this task."
      redirect_to tasks_path
    end
  end

  def choose_location
    render 'choose_location'
  end

  def request_uber
    # without product_id the trip_request will automatically find the cheapest car
    request = @client.trip_request(start_latitude: params[:start_lat], start_longitude: params[:start_lng],
      end_latitude: params[:end_lat], end_longitude: params[:end_lng])
    request_id = request.request_id
    # @client.products(latitude: params[:start_lat], longitude: params[:start_lng])
    @client.trip_update(request_id, 'accepted')
    details = @client.trip_details(request_id)
    @driver = details.driver
    if details.driver
      flash[:success] = "Your Uber will arrive at your location shortly. Your driver is #{@driver.name}, and can be reached at #{@driver.phone_number}"
      redirect_to tasks_show_ride_path
    else
      flash[:success] = "Something went wrong, please try again."
      redirect_to tasks_choose_location_path
    end
  end

  private

  def task_params
    params.require(:task).permit(:id, :full_name, :email, :phone, :title, :description, :money)
  end

  def get_uber_client
    # Get your credentials from the uber API docs: https://developer.uber.com/docs/authentication
    @client = Uber::Client.new do |config|
      config.server_token  = [your_server_token]
      config.client_id = [your_client_id]
      config.client_secret = [your_client_secret]
      config.bearer_token  = [your_bearer_token]
      config.sandbox = true
    end
  end
end

