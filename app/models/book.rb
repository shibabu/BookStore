class Book < ActiveRecord::Base
  belongs_to :category
  belongs_to :author
  belongs_to :publisher

  validates :category_id, :author_id, :publisher_id, :title, :isbn, :price, :buy, :format, :excerpt, :pages, :year, :cover, presence: true
end
