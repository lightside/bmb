module ApplicationHelper

	def logo
		image_tag("sm_logo.gif", :alt => "Black Market Books")
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
