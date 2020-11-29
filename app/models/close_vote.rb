# == Schema Information
#
# Table name: close_votes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  story_id   :integer
#  user_id    :integer
#
class CloseVote < ApplicationRecord

  belongs_to(:users, { :required => false, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:story_parts, { :required => false, :class_name => "StoryPart", :foreign_key => "story_id", :counter_cache => true })
  
end
