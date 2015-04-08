# Jekyll plugin to create sidebar acrchive
# It will only contain years and months within years having links to
# respective archive pages.
# Links with years will target to year directory under yearly archive
# directory.
#Similarly links with months will target to month directory under
#year.

# The above directories will be created by other two plugins:
# One to create yearly archives and the other for monthly archives.

module Jekyll

  class SidebarArchivePage < Page
    def initialize(site, base, dir, data)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'sidebar-archive-page.html')  #template file
      
      self.data['data'] = data
	 	
      #yearly_title_prefix = site.config['yearly_title_prefix'] || 'Yearly Archive for: '
      #self.data['title'] = "#{yearly_title_prefix}#{year}"
      
      # as this plugin for sidebar archive, we will make title straight- Archive
      
      self.data['title'] = "Archive"
      
    end
  end

  class SidebarArchiveGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'sidebar-archive-page'
			years = {}
			count = {}
			years2 = {}
			
			site.posts.reverse.each do |post|
				if years.has_key?(post.date.year)
					if years[post.date.year].include? post.date.month
						count["#{post.date.year}" + "-" + "#{post.date.month}"] = count["#{post.date.year}" + "-" + "#{post.date.month}"] + 1
					else
						years[post.date.year] << post.date.month
						count["#{post.date.year}" + "-" + "#{post.date.month}"] = 1
					end
						
				else
					years[post.date.year] = [post.date.month]
					count["#{post.date.year}" + "-" + "#{post.date.month}"] = 1
				end
			end
			dir = site.config['sidebar_archive_dir'] || 'yearlyArchive2'
			
			years.each do |year|
				actual_year = year[0]
				years2[actual_year] = []
				year[1].each do |month|
					indexString = "#{actual_year}" + "-" + "#{month}"
					if years2[actual_year].size == 0 
						years2[actual_year] = [{ "month"=> month, "count"=> count[indexString]}]
					else
						years2[actual_year] << { "month"=> month, "count"=> count[indexString]}
					end	
				end
			end			
			
						
			site.pages << SidebarArchivePage.new(site, site.source, File.join(dir), years2)
			
      end
    end
    
		
    
  end

end
##### Finally I did not use it, as it was giving problem with month variable in the generator 
#function when tried to use in layout. 
