module ApplicationHelper
	def condition_type_badge(condition)
		content_tag(:span, class: 'badge badge-purple') do |variable|
			concat content_tag(:i, "", class: "#{condition_type_icon_class(condition)} bigger-150")
			concat " " + condition.model_name.human
		end
	end

	def condition_type_icon_class(condition)
		class_name = condition.model_name.to_s
		case class_name
		when "CombinedCondition"
			return "icon-random"
		when "SequenceCondition"
			return "icon-sort-by-order"
		when "LocationCondition"
			return "icon-map-marker"
		when "QrCodeCondition"
			return "icon-qrcode"
		when "QuestionCondition"
			return "icon-question"
		end
	end
end
