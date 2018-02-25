class CreateTrades < ActiveRecord::Migration[5.1]
  def change
    create_table :trades do |t|
      t.integer :trade_type
      t.datetime :date
      t.decimal :price
      t.string :cpf
      t.integer :card_number
      t.datetime :hour
      t.timestamps
    end
  end
end
