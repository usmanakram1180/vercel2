class Comment < ApplicationRecord
  belongs_to :home
  belongs_to :user
  include ActionView::RecordIdentifier

after_create_commit { broadcast_prepend_to [home, :comments], target: "#{dom_id(home)}_comments" }
  
end
