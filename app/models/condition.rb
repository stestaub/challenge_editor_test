require 'awesome_print'

class Condition
  include Mongoid::Document
  field :name
  field :points, type: Integer, default: 0
  field :type, type: String
  field :depth, type: Integer, default: 0
  field :weight, type: String, default: 1
  field :skiponfail, type: Boolean, default: false
  field :sort_order, type: Integer

  embeds_many :feedback_items
  has_one :challenge
  belongs_to :combined_condition
  
  accepts_nested_attributes_for :feedback_items

  def weight_sum
    weight.to_i
  end

  def self.all_except_subs_of(condition)
    excludes = condition.sub_condition_ids
    excludes << condition._id
    self.not_in(_id: excludes)
  end

  def as_json
  	{
      "$type" => type,
      "id" => _id.to_s,
      "priority" => depth,
      "conditionFeedbackItems" => feedback_items.as_json
    }.merge (super().except("type", "_id", "depth", "feedback_items"))
  end
end
