class HelpText < ActiveRecord::Base
  validates :text, presence: true, length: {maximum: 80}
end
