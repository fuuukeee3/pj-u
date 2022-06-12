class PhotosController < ApplicationController
  before_action :login_check, only: [:index, :new]

  def index
    @photos = current_user.photos.order(created_at: :desc, id: :desc)
  end

  def new
  end
end
