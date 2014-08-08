module ApplicationHelper


  def errors_for(model, attribute)

    if model.errors[attribute].present?
    content_tag :span, model.errors[attribute].join(", "), :class => 'error_explain'
    end
  end
end
