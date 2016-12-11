class AddTokenToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :access_token, :string
  end
end
