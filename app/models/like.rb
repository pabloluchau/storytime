# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  story_id   :integer
#  user_id    :integer
#
class Like < ApplicationRecord
  
  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:story, { :required => false, :class_name => "Story", :foreign_key => "story_id", :counter_cache => true })
end
