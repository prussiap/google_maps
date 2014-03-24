class MapsController < ApplicationController
  respond_to :json

  def new
    puts params['klag']
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    puts params['klag']
    respond_to do |format|
      format.html
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
