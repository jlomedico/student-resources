class SiteController < ApplicationController
  def search
    @results = Artist.search(params[:term]) + Group.search(params[:term])
  end

  def home
  end
end
