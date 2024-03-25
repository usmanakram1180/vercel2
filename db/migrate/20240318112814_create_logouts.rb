class CreateLogouts < ActiveRecord::Migration[7.1]
  def change
    create_table :logouts do |t|

      t.timestamps
    end
  end
end
