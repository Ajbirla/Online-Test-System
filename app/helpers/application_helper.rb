module ApplicationHelper
# def link_to_add_row(name, f, association, **args)
#     new_object = f.object.send(association).klass.new
#     id = new_object.object_id
#     fields =f.fields_for(association, new_object, child_index: id) do |builder|
#       render(association.to_s.singularize, f: builder)
#     end
#     link_to(name, '#', class: "add_fields " + args[:class], data: {id: id, fields: fields.gsub("\n", "")})
#   end
	# def link_to_remove_fields(name, f)
 #    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
 #  end
  
 #  def link_to_add_fields(name, f, association)
 #    new_object = f.object.class.reflect_on_association(association).klass.new
 #    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
 #      render(association.to_s.singularize + "_fields", :f => builder)
 #    end
 #    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
 #  end

 def paginate(collection, params= {})
   
    will_paginate collection, params.merge(:renderer => RemoteLinkPaginationHelper::LinkRenderer)
  end
  
end
