class QuestionCondition < Condition
  include Mongoid::Document
  field :correct_answers, type: Array
  after_initialize :set_type

  def set_type
  	self.type = 'Drallo.ChallengeEngine.EventCondition.QuestionCondition, DralloChallengeEngine'
  end

  def as_json
  	super().except("correct_answers").merge({"CorrectAnswers" => correct_answers})
  end
end
