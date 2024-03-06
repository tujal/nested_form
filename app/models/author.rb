class Author < ApplicationRecord
  has_many :books 
  accepts_nested_attributes_for :books, allow_destroy: true
end
