class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :name
      t.datetime :buydate
      t.integer :buynum
      t.integer :buyprice
      t.datetime :selldate
      t.integer :sellnum
      t.integer :sellprice
      t.string :note
      t.integer :judge
      t.integer :profitloss
      t.binary :picture
      t.string :filename

      t.timestamps
    end
  end
end
