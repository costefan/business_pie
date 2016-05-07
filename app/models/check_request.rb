class CheckRequest
  include Mongoid::Document
  include Mongoid::Timestamps

  field :location, type: Point
  has_one :user, foreign_key: :user_id, class_name: 'User'
  embeds_one :request_type, class_name: 'RequestType'
  index({ 'request_type.name' => 1}, { unique: true })
end