class UrlsController < ApplicationController

  def index
    @urls = Url.all
  end

  def new

    @url = Url.new
  end

  def create
    
    @url = Url.new(params.require(:url).permit(:full_url))
    @url.save

    if @url.errors.any?
      Rails.logger.info "Has errors: #{@url.errors.messages}"
      render 'urls/new'
    else
      Rails.logger.info "No errors!"
      redirect_to urls_url
      return
    end

  end

  def redirect

    url = Url.find_by url_code: params[:url_code]
    url.increment(:click_count)
    url.save

    redirect_to url.full_url
    
  end

end
