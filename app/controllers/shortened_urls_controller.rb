class ShortenedUrlsController < ApplicationController

  def new
    @shortener = Shortener::ShortenedUrl.new
  end

  def create
    @generated_url = Shortener::ShortenedUrl.generate(params[:shortener_shortened_url][:url])
    redirect_to shortened_url_path(@generated_url.id)
  end

  def show
    @show_generated_url = Shortener::ShortenedUrl.find(params[:id])
    @all_urls = Shortener::ShortenedUrl.all.includes(:url_histories).order(created_at: :asc)
  end
end