module Jekyll
module SummarizePosts
  def summarizeToYearMonth(input)
		years = {}
		count = {}
		years2 = {}
			
		input.each do |post|
			
			if years.has_key?(post.date.year)
				
				
				if years[post.date.year].include? post.date.month
					count["#{post.date.year}" + "-" + "#{post.date.month}"] = count["#{post.date.year}" + "-" + "#{post.date.month}"] + 1
				else
					years[post.date.year] << post.date.month
					count["#{post.date.year}" + "-" + "#{post.date.month}"] = 1
				end
					
			else
				years[post.date.year] = [ post.date.month ]
				count["#{post.date.year}" + "-" + "#{post.date.month}"] = 1
			end
		end
		
		
		years.each do |year|
			actual_year = year[0]
			years2[actual_year] = []
			year[1].each do |month|
				indexString = "#{actual_year}" + "-" + "#{month}"
				month = "%02d" % "#{month}"   #it is to facilitate to link to month directory with double digit
				if years2[actual_year].size == 0 
					years2[actual_year] = [{ "month"=> month, "count"=> count[indexString]}]
				else
					years2[actual_year] << { "month"=> month, "count"=> count[indexString]}
				end	
			end
		end		
		years2    #returning this hash/array
	end
end
end	
Liquid::Template.register_filter(Jekyll::SummarizePosts)
