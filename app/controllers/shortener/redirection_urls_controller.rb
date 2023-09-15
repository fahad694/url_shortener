class Shortener::RedirectionUrlsController < Shortener::ShortenedUrlsController
  
  def show
    shortened_url = Shortener::ShortenedUrl.where(unique_key: params[:id]).first
    url = UrlHistory.create(ip: request.ip, shortened_url_id: shortened_url.id, country: request.location.country city: request.location.city)
    token = ::Shortener::ShortenedUrl.extract_token(params[:id])
    track = Shortener.ignore_robots.blank? || request.human?
    url   = ::Shortener::ShortenedUrl.fetch_with_token(token: token, additional_params: params, track: track)
    redirect_to url[:url], status: :moved_permanently
  end
end