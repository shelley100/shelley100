require 'date'

$sourceDir = '/home/abul/myjekyll/_site/*'
$targetDirForCp = '/home/abul/learngit/'
$targetDir = '/home/abul/learngit'
$targetDirForDel = '/home/abul/learngit/*'

task :default => :server

desc 'Clean up generated site'
task :clean do
  cleanup
end

desc 'Build site with Jekyll'
task :build do
  jekyll('build')
end

desc 'Start server with --watch'
task :server => :clean do
  jekyll('serve --watch --trace')
end

desc 'Build and deploy'
task :deploy => :build do
  #sh 'rsync -rvtzh --progress --delete _site/ shelley100@github.io:shelley100.git'
  #sh 'rsync -vthrz --progress --delete shelley100@github.com:shelley100.git /home/abul/twittsite/_site/'
  sh "rm -r " + $targetDirForDel
  puts "Target Directory Contents Deleted"
  sh "cp -rv " + $sourceDir + " " + $targetDirForCp
  puts "SourceDir contents copied to TargetDir"
  sh "cd " + $targetDir
  puts "Changed to Directory: "
  sh "pwd"
  sh "git add -A"
  sh "git commit -m " + getdatetime
  sh "git push"
  puts "Pushed completed"
end

desc 'Check links for site already running on localhost:4000'
task :check_links do
  begin
    require 'anemone'
    root = 'http://localhost:4000/'
    Anemone.crawl(root, :discard_page_bodies => true) do |anemone|
      anemone.after_crawl do |pagestore|
        broken_links = Hash.new { |h, k| h[k] = [] }
        pagestore.each_value do |page|
          if page.code != 200
            referrers = pagestore.pages_linking_to(page.url)
            referrers.each do |referrer|
              broken_links[referrer] << page
            end
          end
        end
        broken_links.each do |referrer, pages|
          puts "#{referrer.url} contains the following broken links:"
          pages.each do |page|
            puts "  HTTP #{page.code} #{page.url}"
          end
        end
      end
    end

  rescue LoadError
    abort 'Install anemone gem: gem install anemone'
  end
end

def cleanup
  sh 'rm -rf _site'
end

def jekyll(opts = '')
  sh 'bundle exec jekyll ' + opts
end

def getdatetime
	dtTime = Time.now.utc.to_s
	
end	
