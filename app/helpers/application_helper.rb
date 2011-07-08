module ApplicationHelper

	def logo
		logo = image_tag("lg_logo.gif", :alt => "Black Market Books", :class => "main_logo")
	end

	# Return a title on a per-page basis
	def title
		base_title = "Black Market Books"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end
end
