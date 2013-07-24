require "awesome_print"
class CombinedCondition < Condition
  include Mongoid::Document
  field :combination_type, type: Integer
  field :min_successful_children, type: Integer
  
  has_many :sub_conditions, class_name: "Condition", order: 'sort_order ASC'
  accepts_nested_attributes_for :sub_conditions

  after_initialize :set_type

  def weight_sum
    sub_conditions.inject(0) { |sum, condition| sum + condition.weight_sum }
  end

  def sub_conditions_attributes
    self.sub_conditions.map do |sub_condition| 
      { name: sub_condition.name, order: sub_condition.sort_order, id: sub_condition._id }
    end
  end

  def sub_conditions_attributes=(sub_conditions_attributes)
    ids = sub_conditions_attributes.map { |a| a[:id] }
    tmp_subconditions = []
    sub_conditions_attributes.each do |cond_att|
      condition = Condition.find(cond_att[:id])
      condition.sort_order = cond_att[:order]
      condition.save
      tmp_subconditions << condition
    end
    self.sub_conditions = tmp_subconditions
  end

  def as_json
    sub_cond = {}
    count = 0
    sub_conditions.each do |c| 
      c.depth = self.depth.nil? ? 1 : self.depth + 1
      sub_cond[count.to_s.to_sym] = c.as_json
      count += 1
    end
    super().except("combination_type", "min_successful_children", "sub_conditions").merge ({
      "SubConditions" => sub_cond,
      "CombinationType" => combination_type,
      "MinSuccessfulChildren" => min_successful_children

    })
  end

  def set_type
  	self.type = 'Drallo.ChallengeEngine.CombinedCondition, DralloChallengeEngine'
  end
end
