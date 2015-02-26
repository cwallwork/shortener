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


    url.errors.messages[:full_url]
  end

  private

  def build_url
    @url ||= url_scope.new
    @url.attributes = url_params
  end

  def url_params
    byebug
    params.require(:url).permit(:full_url)
  end

  def load_popular
    @urls ||= Url.popular
  end

  def create_url
    build_url
    @url = url_scope.find_or_save()
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