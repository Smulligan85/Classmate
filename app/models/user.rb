class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "70x70>" }, :default_url => ":style/default.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :projects
  has_many :notes
  has_many :conversations, :foreign_key => :sender_id
end
