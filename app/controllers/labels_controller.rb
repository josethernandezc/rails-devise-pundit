class LabelsController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @labels = Label.all
    authorize Label
  end

  def new
    @label = Label.new
    authorize @label
  end

  def create
    @label = Label.new(secure_params)
    authorize @label

    if @label.save
      flash[:notice] = "The label was created."
      redirect_to labels_path
    else
      render "new"
    end
  end

  def edit
    @label = Label.find(params[:id])
    authorize @label
  end

  def update
    @label = Label.find(params[:id])
    authorize @label

    if @label.update(secure_params)
      flash[:notice] = "The label was updated."
      redirect_to labels_path
    else
      render "edit"
    end
  end

  def destroy
    label = Label.find(params[:id])
    authorize label

    if label.destroy
      flash[:notice] = "The label was destroyed."
    else
      flash[:notice] = "An error occurred, please try again."
    end

    redirect_to labels_path
  end

  private

  def secure_params
    params.require(:label).permit(:name, :colour)
  end
end
