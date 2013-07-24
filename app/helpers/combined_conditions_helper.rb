module CombinedConditionsHelper

	def link_to_add_condition(condition, form_builder)
    condition = render 'shared/subcondition_fields', f: form_builder,
    	subcondition: {name: condition.name, id: condition._id, new_record: true, order: "_order_value"}

    link_to("Add Condition", '#', class: "add_condition", data: { order: "_order_value", condition: condition.gsub("\n", "")})
  end
end
