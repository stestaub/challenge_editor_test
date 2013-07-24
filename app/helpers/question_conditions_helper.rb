module QuestionConditionsHelper

	def link_to_add_fields(name)
    fields = render 'answer_fields', answer: ""
    link_to(name, '#', class: "add_fields", data: { fields: fields.gsub("\n", "")})
  end

end
