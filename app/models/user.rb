class User < ActiveRecord::Base

#  before_validation(on: :create) {self.admin = false} #:put_admin_to_false
  belongs_to :bar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #,:confirmable

#  validates :admin, inclusion: { in: [true, false] }

#  with_options unless: :admin do |n1a|
#    n1a.validates :bar, presence: true
#  end


  def to_s
    email
  end

  def authenticate!


  end

  private
    def put_admin_to_false
      self.admin = false
    end

end
