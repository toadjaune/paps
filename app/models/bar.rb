class Bar < ActiveRecord::Base

  has_many :users, dependent: :destroy

  validates :name, presence: true,
                   length: {minimum: 5 }

  def to_s
    name
  end
end
