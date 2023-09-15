class AddColumnToShortenedUrls < ActiveRecord::Migration[7.0]
  def change
    add_column :url_histories, :shortened_url_id, :int
  end
end
