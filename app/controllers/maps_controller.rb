class MapsController < ApplicationController
  respond_to :json

  def new
    puts params
  end

  def create
    p params
    respond_to do |format|
      format.js
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end
end
