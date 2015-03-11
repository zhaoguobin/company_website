class Admin::SettingsController < Admin::BaseController

  before_filter :get_index_images, :only => [:index, :create]

  def index
    
  end

  def create
    @index_image = IndexImage.new(index_image_params)
    if @index_image.save
      redirect_to admin_settings_path
    else
      render :index
    end
  end

  def update
    logo_file = params[:settings].delete(:site_logo_file)
    Settings.update_settings(params[:settings])

    if logo_file.present?
      uploader = LogoPhotoUploader.new
      uploader.store!(logo_file)
      Settings.site_logo = "/uploads/logo/logo." + logo_file.original_filename.split(".").last
      Settings.save!
    end

    redirect_to admin_settings_path
  end

  def destroy
    @index_image = IndexImage.find(params[:id])
    @index_image.destroy
    redirect_to admin_settings_path
  end

  def sort
    @index_image = IndexImage.find(params[:id])
    @index_image.insert_at params[:position].to_i
    return render :text => "ok"
  end

  def update_link
    @index_image = IndexImage.find(params[:id])
    @index_image.update_attributes(edit_index_image_params)
    return render :js => "
      $('#index_#{@index_image.id} .index_image_link a').text('#{@index_image.link}');
      $('#edit_index_image button.close').click();
    "
  end

  protected

  def get_index_images
    @index_images = IndexImage.all
    @index_image = IndexImage.new
  end

  def index_image_params
    params.require(:index_image).permit(:photo, :link)
  end

  def edit_index_image_params
    params.require(:index_image).permit(:link)
  end

end
