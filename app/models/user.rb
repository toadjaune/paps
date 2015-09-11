class User < ActiveRecord::Base
  validates :name,  presence: true,
                    uniqueness: true
  validates :admin, inclusion: { in: [true, false] }

  def to_s
    name
  end

  def authenticate!


  end
end
