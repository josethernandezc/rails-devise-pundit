class LabelsController < ApplicationController
  before_action :authenticate_user!

  def index
    @labels = Label.all
  end

  def new
    @label = Label.new
  end

  def create
    @label = Label.new(secure_params)

    if @label.save
      flash[:notice] = "The label was created."
      redirect_to labels_path
    else
      render "new"
    end
  end

  def edit
    @label = Label.find(params[:id])
  end

  def update
    @label = Label.find(params[:id])

    if @label.update(secure_params)
      flash[:notice] = "The label was updated."
      redirect_to labels_path
    else
      render "edit"
    end
  end

  def destroy
    label = Label.find(params[:id])

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
