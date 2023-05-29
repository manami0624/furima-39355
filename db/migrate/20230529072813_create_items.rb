class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references  :user
      t.string      :item_name
      t.text        :description
      t.integer     :category_id
      t.integer     :condition_id
      t.integer     :postage_id
      t.integer     :prefecture_id
      t.integer     :shipping_day_id
      t.integer     :price

      t.timestamps
    end
  end
end
