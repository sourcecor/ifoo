module Admin::MenusHelper
	def g_side_menu menu
		if !menu.menus.where(:user_id => current_admin_user.id).empty?
			# 
			contents = []
			menu.menus.where(:user_id => current_admin_user.id).each do |sub|
				contents << content_tag((sub.position=="item" ? :a : :div), sub.caption, class: (sub.position=="item" ? :item : sub.position), href: eval(sub.action))
			end
			# 
			title = content_tag(:div, content_tag(:i, "", class:"dropdown icon") + menu.caption, class: "title")
			content = content_tag(:div, contents.join("\n").html_safe, class: "content")
			container = content_tag(:div, title + content, class: "item")
		else
			content_tag(:a, menu.caption, class: :item, href: eval(menu.action) )
		end
	end

	def g_nav_menu menu, _class='ui simple dropdown item'
		if !menu.menus.where(:user_id => current_admin_user.id).empty?
			# 
			contents = []
			menu.menus.where(:user_id => current_admin_user.id).each do |menu|
				if !menu.sub_menus.where(:user_id => current_admin_user.id).empty?
					contents << g_nav_menu(menu, 'item')
				else
					contents << content_tag((menu.position=="item" ? :a : :div), menu.caption, class: (menu.position=="item" ? :item : menu.position), href: eval(menu.action))
				end
			end
			#
			title = content_tag(:i, "", class:"dropdown icon")
			content = content_tag(:div, contents.join("\n").html_safe, class: "menu")
			container = content_tag(:div, [menu.caption, title, content].join("\n").html_safe, class: _class)
		else
			content_tag(:a, menu.caption, class: :item, href: eval(menu.action)) do
				concat(content_tag(:span, menu.caption))
				concat(content_tag(:div, "-", class: "ui red top right attached label", name: menu.action, style: "display: none"))
			end
		end
	end
end



