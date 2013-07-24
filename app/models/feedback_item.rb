class FeedbackItem
  include Mongoid::Document
  field :feedbackAppearance, type: Integer
  field :actionLink, type: Integer
  field :contentHtmlShort, type: String
  field :contentHtmlFull, type: String

  embedded_in :condition 
end
