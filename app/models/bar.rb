class Bar < ActiveRecord::Base

  has_many :n1as, dependent: :destroy

  validates :name, presence: true,
                   length: {minimum: 5 }

  def to_s
    name
  end
end
