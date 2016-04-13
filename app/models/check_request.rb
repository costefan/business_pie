class CheckRequest
  include Mongoid::Document
  include Mongoid::Timestamps

  field :location, type: Point
  has_one :user, foreign_key: :user_id, class_name: 'User'
  embeds_one :request_types, class_name: 'RequestType'
end