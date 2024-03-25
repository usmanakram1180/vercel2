class AddLikesAndDislikesToHomes < ActiveRecord::Migration[7.1]
  def change
    add_column :homes, :likes, :integer
    add_column :homes, :dislikes, :integer
  end
end
