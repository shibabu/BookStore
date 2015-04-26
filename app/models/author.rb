class Author < ActiveRecord::Base
  has_many :books
  validates :first_name, :last_name, presence: true, length: {minimum: 3}

  def name
    [self.first_name, self.last_name].join(' ')
  end
end
