class OfficesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def product_params
    params.require(:office).permit("#", photo: []) # to be filled
  end
end
