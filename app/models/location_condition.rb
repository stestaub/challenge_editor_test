class LocationCondition < Condition
  include Mongoid::Document
  field :location, type: String
  field :radius, type: Integer

  after_initialize :set_type

  def set_type
  	self.type = 'Drallo.ChallengeEngine.GeoCondition.LocationCondition, DralloChallengeEngine'
  end
end
