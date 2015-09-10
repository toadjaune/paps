class N1a < User
  belongs_to :bar
  validates :bar, presence: true
  validates :admin, inclusion: { in: [false] }
end
