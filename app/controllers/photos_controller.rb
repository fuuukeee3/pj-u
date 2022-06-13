class PhotosController < ApplicationController
  before_action :login_check, only: [:index, :new]

  def index
    @photos = current_user.photos.order(created_at: :desc, id: :desc)
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.build(title: photo_params[:title])

    # アップロードされた画像ファイルの保存
    if photo_params[:image_file]
      dir = Rails.root.join("app/assets/images/uploads")
      ext = File.extname(photo_params[:image_file].tempfile.path)
      file_name = "#{Time.zone.now.strftime("%Y%m%d%H%M%S")}#{ext}"
      file_path = "#{dir}/#{file_name}"
      File.binwrite(file_path, photo_params[:image_file].tempfile.read)
      @photo.image_file = "uploads/#{file_name}"
    else
      @photo.errors.add(:base, '画像ファイルを入力してください')
    end

    if @photo.save
      redirect_to photos_path
    else
      render :new
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :image_file)
  end
end
