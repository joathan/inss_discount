# frozen_string_literal: true

# Path: app/helpers/application_helper.rb
module ApplicationHelper
  def active_class(link_path)
    current_page?(link_path) ? 'active' : ''
  end

  def errors_for(form, field)
    return nil if form.object.errors.blank?

    tag.p(form.object.errors[field].try(:first), class: 'text-danger ms-2 fw-medium')
  end

  def valid(form, field)
    return nil if form.object.errors.blank?

    form.object.errors[field].blank? ? 'is-valid' : 'is-invalid'
  end
end
