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
      render @url
    else
     render new_path
    end
  end

  private

  def build_url
    @url ||= url_scope.build
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
    @url = url_scope.find_or_save()
  end

  def assign_url
    if user_signed_in?
      @url << current_user.urls
    end
  end

  def url_scope
    Url.all
  end

end