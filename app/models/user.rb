class User < ActiveRecord::Base
  has_many :tables
  validates_uniqueness_of :name
  has_secure_password

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find do |user|
      user.slug == slug
    end

  end

end
