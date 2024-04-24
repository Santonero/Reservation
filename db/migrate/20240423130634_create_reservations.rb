class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.integer :num_billet
      t.integer :num_reserv
      t.datetime :date
      t.time :hour
      t.integer :show_key
      t.string :show
      t.integer :represent_key
      t.string :represent
      t.date :represent_date
      t.time :represent_hour
      t.date :represent_end_date
      t.time :represent_end_hour
      t.decimal :price, precision: 8, scale: 2
      t.string :product_type
      t.string :sales_channel
      t.string :lastname
      t.string :firstname
      t.string :email
      t.string :adress
      t.integer :pcode
      t.string :country
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end
end
