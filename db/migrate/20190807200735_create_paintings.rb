class CreatePaintings < ActiveRecord::Migration
  def change
    create_table :paintings do |t|
      t.boolean :public
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
