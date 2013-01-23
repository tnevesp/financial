# encoding: UTF-8
module ApplicationHelper

  def class_property_for_menu(menu)
  	return ' class=active' if params[:controller] == menu
  end

  def label_for_edit
  	content_tag('i', '', { :class => 'icon-pencil' }) + " Edit"
  end

  def label_for_destroy
  	content_tag('i', '', { :class => 'icon-trash' }) + " Destroy"
  end

  def link_to_edit(klass)
  	link_to label_for_edit, send("edit_#{klass.class.name.underscore}_path", klass), :class => 'btn btn-small'
  end

  def link_to_destroy(klass)
  	link_to label_for_destroy, klass, method: :delete, data: { confirm: 'Are you sure?' }, :class => 'btn btn-small btn-danger'
  end

  def format_date(date)
    return if date.blank?
    date.strftime('%d/%m/%Y')
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end
end
