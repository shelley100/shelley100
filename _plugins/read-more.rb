module PostMore
  def postmorefilter(input, url, text)
    if input.include? "<!--more-->"
      input.split("<!--more-->").first + "<span class='more'><a href='#{ url }'>#{ text }</spana></p>"
    else
      input
    end
  end
end

Liquid::Template.register_filter(PostMore)
