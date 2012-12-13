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
end
