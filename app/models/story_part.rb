# == Schema Information
#
# Table name: story_parts
#
#  id                :integer          not null, primary key
#  body              :string
#  close_votes_count :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  story_id          :integer
#  user_id           :integer
#
class StoryPart < ApplicationRecord

  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:story, { :required => false, :class_name => "Story", :foreign_key => "story_id" })

  has_many(:close_votes, { :class_name => "CloseVote", :foreign_key => "story_id", :dependent => :destroy })


end
