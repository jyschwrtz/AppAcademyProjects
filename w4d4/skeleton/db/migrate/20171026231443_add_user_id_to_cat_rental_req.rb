class AddUserIdToCatRentalReq < ActiveRecord::Migration[5.1]
  def change
    add_column :cat_rental_requests, :user_id, :integer, null: false, index: true, default: 2
  end
end
