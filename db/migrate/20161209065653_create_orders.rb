class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string      :name,     null: false, limit: 255
      t.integer     :quantity, null: false
      t.string      :milk,     null: false
      t.string      :size,     null: false
      t.string      :payment,  null: false
    end
  end
end
