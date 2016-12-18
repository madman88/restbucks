class CreateUser < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string      :name,    null: false, limit: 255
    end
  end
end
