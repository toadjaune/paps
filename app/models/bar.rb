class Bar < ActiveRecord::Base
  has_many :paps, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :crenaus, through: :paps

  validates :name, presence: true,
                   length: {minimum: 5 }

  def to_s
    name
  end
end
