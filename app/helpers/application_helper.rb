module ApplicationHelper
  def markdown(text, attrs = {})
    renderer = Redcarpet::Render::HTML.new(attrs)
    markdown = Redcarpet::Markdown.new(renderer)
    markdown.render(text).html_safe
  end

  def published_date_of(post)
    if post.created_at < 1.day.ago
      post.created_at.strftime "#{post.created_at.day.ordinalize} %B %Y"
    else
      "#{time_ago_in_words post.created_at} ago"
    end
  end
end
