class Tool < ActiveRecord::Base
  validates :name, uniqueness: true, length: {maximum: 30}
  has_and_belongs_to_many :users
end
