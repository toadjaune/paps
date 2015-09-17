class User < ActiveRecord::Base

  before_validation(on: :create) do
    self.admin = false
    p "bleh"
  end
  belongs_to :bar
  has_many :tentatives

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #,:confirmable

  validates :admin, inclusion: { in: [true, false] }

#  with_options unless: :admin do |n1a|
#    n1a.validates :bar, presence: true
#  end


  def to_s
    email
  end

end
