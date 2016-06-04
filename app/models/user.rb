class User < ActiveRecord::Base
  validates :first , :presence => true, :length => {:maximum => 30}
  validates :last , :presence => true, :length => {:maximum => 30}
  validates :email, :presence => true, :length => {:maximum => 100}, :format => {:with => /@/}
  
  scope :sorted, lambda { order("users.created_at ASC")}
end
