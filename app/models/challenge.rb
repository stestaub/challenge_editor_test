class Challenge
  include Mongoid::Document
  field :title, type: String
  field :description, type: String
  field :points, type: Integer
  field :level, type: Integer
  field :condition_weight_sum, type: Integer

  belongs_to :condition

  accepts_nested_attributes_for :condition


  def as_json
    super().except("condition", "_id", "condition_weight_sum").merge({ "condition" => condition.as_json, "ConditionWeighSum" => condition.weight_sum })
  end

end
