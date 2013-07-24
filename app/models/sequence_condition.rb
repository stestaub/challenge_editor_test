class SequenceCondition < CombinedCondition
  include Mongoid::Document

  def set_type
  	self.type = 'Drallo.ChallengeEngine.SequenceCondition, DralloChallengeEngine'
  end
end
