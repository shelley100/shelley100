module Jekyll

  class YearlyArchivePage < Page
    def initialize(site, base, dir, year, data)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'yearly-archive-page.html')
      self.data['year'] = year
      self.data['data'] = data

      yearly_title_prefix = site.config['yearly_title_prefix'] || 'Yearly Archive for: '
      self.data['title'] = "#{yearly_title_prefix}#{year}"
    end
  end

  class YearlyArchiveGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'yearly-archive-page'
			years = {}
			site.posts.each do |post|
				if years.has_key?(post.date.year)
					years[post.date.year] << {"url"=>post.url, "title"=>post.title}
				else
					years[post.date.year] = [{"url"=>post.url, "title"=>post.title}]
				end
			end
			dir = site.config['yearly_archive_dir'] || 'yearlyArchive'
			
			years.each do |year|
				
				site.pages << YearlyArchivePage.new(site, site.source, File.join(dir, (year[0]).to_s), (year[0]).to_s, year[1])
			end
      end
    end
    
		
    
  end

end
