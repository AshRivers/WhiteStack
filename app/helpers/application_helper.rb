module ApplicationHelper
	
	def truncate_article(article)
      output = h truncate(article.post, :length => 350, separator: ' ',:omission => '...')
      output += link_to('[read rest]', article_path(article)) if article.post.size > 300
      output.html_safe
    end
end
