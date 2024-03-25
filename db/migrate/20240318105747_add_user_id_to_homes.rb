class AddUserIdToHomes < ActiveRecord::Migration[7.1]
  def change
    add_reference :homes, :user, null: false, foreign_key: true
  end
end
