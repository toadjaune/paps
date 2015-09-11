class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #,:confirmable
  validates :name,  presence: true,
                    uniqueness: true
  validates :admin, inclusion: { in: [true, false] }

  def to_s
    name
  end

  def authenticate!


  end
end
