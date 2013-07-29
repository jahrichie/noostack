module ApplicationHelper



  # def background_color_helpa
  #   background_color = ["#EEEA1D", "#07A984", "#CB5E7B", "#00CCFC", "#CC99FE", "#FF99CB", 
  #                       "C2F75E", "#000", "#404040","#FA9B88"]
  # end

  def random_neons  
   _top = AppStyle::BACKGROUND_AND_FONT.size
    AppStyle::BACKGROUND_AND_FONT[[*1.._top].sample].first
  end


  def stack_representation(ingredient, top_range)
    # array order: [background, font]
    random_neons = AppStyle::BACKGROUND_AND_FONT[[*1..top_range].sample]
    <<-LINK
      <div class="stack stack-representation" style="font-size:#{ingredient.percentage/12 }em;height:#{ingredient.percentage}%;background: #{random_neons.first};color: #{random_neons.last}">  #{ingredient.name} <span class="stack-percentage">(#{number_to_percentage(ingredient.percentage,precision: 0)})</span></div>
      LINK
  end


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


  def link_to_add_goals(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      #render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_goals(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end



end
