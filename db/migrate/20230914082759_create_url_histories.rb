class CreateUrlHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :url_histories do |t|
      t.string :ip
      t.string :country
      t.string :city

      t.timestamps
    end
  end
end
