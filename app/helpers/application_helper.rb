module ApplicationHelper

  def user_with_icon(current_user)
    link_to "<i class='icon-user'></i>".html_safe + " " + truncate((current_user.username), :length => 40,:omission => "..."), current_userpath(current_user)
  end
  
  def current_userpath(current_user)
    current_userpath = "/users/"+current_user.username
  end


  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      #render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end


end
