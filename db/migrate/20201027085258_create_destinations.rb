class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.references  :order, null: false, foreign_key: true
      t.string      :postal_code, null: false
      t.integer     :address_pref_id, null: false
      t.string      :address_city, null: false
      t.string      :address_num, null: false
      t.string      :address_build
      t.string      :phone_number, null: false
      t.timestamps
    end
  end
end
