class HelpText < ActiveRecord::Base
  validates :description, presence: true, length: {maximum: 80}
end
