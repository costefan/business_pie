class SearchRequest
  include Mongoid::Document
  include Mongoid::Timestamps

  field :center, type: Point
  field :radius, type: Float
  has_one :user, foreign_key: :user_id, class_name: 'User'
  embeds_one :request_types, class_name: 'RequestType'
end