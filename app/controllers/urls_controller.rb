require 'byebug'
class UrlsController < ApplicationController

  def popular
    load_popular
  end

  def new
    build_url
  end

  def create
    if create_url
      assign_url
    end

    if @url.errors
      render :json => @url.errors.messages[:full_url]
    else
      render :json => @url
    end
  end

  private

  def build_url
    @url ||= url_scope.new
    @url.attributes = url_params
  end

  def url_params
    params.require(:url).permit(:full_url)
  end

  def load_popular
    @urls ||= Url.popular
  end

  def create_url
    build_url
    @url = url_scope.find_or_save(@url)
  end

  def assign_url
    if user_signed_in?
      @url << current_user.urls
    end
  end

  def url_scope
    Url.scoped
  end

end