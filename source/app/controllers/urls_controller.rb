class UrlsController < ApplicationController

  def index
    @urls = Url.all
  end

  def new
  end

  def create
    
    @url = Url.new(params.permit(:full_url))

    @url.save
    redirect_to urls_url

  end

  def redirect

    url = Url.find_by url_code: params[:url_code]
    url.increment(:click_count)
    url.save

    redirect_to url.full_url
    
  end

end
