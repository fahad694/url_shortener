class UrlHistory < ApplicationRecord
  belongs_to :shortened_url, class_name: 'Shortener::ShortenedUrl', optional: true
end
