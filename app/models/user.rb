# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  email              :string
#  password_digest    :string
#  story_starts_count :integer
#  username           :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class User < ApplicationRecord
  validates(:username, { :uniqueness => true })
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:story_starts, { :class_name => "Story", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:story_parts, { :class_name => "StoryPart", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:likes, { :class_name => "Like", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:close_votes, { :class_name => "CloseVote", :foreign_key => "user_id", :dependent => :destroy })  

  has_many(:stories, { :through => :likes, :source => :story })
  has_many(:voted_parts, { :through => :close_votes, :source => :story_parts})

end
