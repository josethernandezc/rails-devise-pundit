class LabelsController < ApplicationController
  before_action :authenticate_user!

  def new
    @label = Label.new
  end

  def create
    @label = Label.new(secure_params)

    if @label.save
      redirect_to labels_path
    else
      render 'new'
    end
  end

  private

  def secure_params
    params.require(:label).permit(:name, :colour)
  end
end
