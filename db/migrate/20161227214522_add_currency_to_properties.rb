class AddCurrencyToProperties < ActiveRecord::Migration
  def change
    add_reference :properties, :currency, index: true, foreign_key: true
  end
end
