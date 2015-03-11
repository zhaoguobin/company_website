class User < ActiveRecord::Base

  has_secure_password

  validates :login, :presence => true, :uniqueness => true # {:case_sensitive => false}
  validates :password, :length => {:minimum => 6, :allow_blank => true}

  scope :admins, -> {where(["role_id = ?", self.class.roles[:'管理员']])}

  def self.roles
    {
      :'管理员' => 0,
      :'超级管理员' => 1
    }
  end

  def super_admin?
    self.role_id == self.class.roles[:'超级管理员']
  end

  def role
    self.class.roles.each do |key, value|
      return key if self.role_id == value
    end
  end
end
