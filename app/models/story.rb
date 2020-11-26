# == Schema Information
#
# Table name: stories
#
#  id          :integer          not null, primary key
#  body        :string
#  filter      :string
#  likes_count :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
class Story < ApplicationRecord
  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id", :counter_cache => :story_starts_count })

  has_many(:story_parts, { :class_name => "StoryPart", :foreign_key => "story_id", :dependent => :destroy })
  has_many(:likes, { :class_name => "Like", :foreign_key => "story_id", :dependent => :destroy })

  has_many(:users, { :through => :likes, :source => :user })

end
