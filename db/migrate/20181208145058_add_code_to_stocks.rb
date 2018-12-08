class AddCodeToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :code, :number
  end
end
