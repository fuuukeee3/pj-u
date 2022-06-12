class PhotosController < ApplicationController
  before_action :login_check, only: [:index, :new]

  def index
    @photos = Photo.all
  end

  def new
  end
end
