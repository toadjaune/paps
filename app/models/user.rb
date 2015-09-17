class User < ActiveRecord::Base

  belongs_to :bar
  has_many :tentatives

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable
  validates :admin, inclusion: { in: [true, false] }
  validates :email, format: { with: /.*@supelec\.fr/, message: 'L\'email doit être en @supelec.fr' }
  before_validation(on: :create) do
    self.admin = false
    p "bleh"
  end
  with_options unless: :admin do |n1a|
    n1a.validates :bar, presence: true
  end


  def to_s
    email
  end

end
