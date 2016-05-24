class SearchRequest
  include Mongoid::Document
  include Mongoid::Timestamps

  field :loc, :type => Array
  index({ loc: '2d' }, { min: -200, max: 200 })

  field :radius, type: Float
  has_one :user, foreign_key: :user_id, class_name: 'User'
  has_one :request_type, class_name: 'RequestType'
  index({ 'request_type.name' => 1}, { unique: true })
end