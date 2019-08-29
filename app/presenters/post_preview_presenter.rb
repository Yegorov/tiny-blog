# frozen_string_literal: true

class PostPreviewPresenter < BasePresenter
  alias :post :model

  def title
    post.title.presence || 'Man must explore, and this is exploration at its greatest'
  end

  def subtitle
    post.subtitle.presence || 'Problems look mighty small from 150 miles up'
  end

  def author
    post.author.name.presence || 'Start Bootstrap'
  end

  def date
    post.date.strftime('on %B %d, %Y').presence || 'on Semptember 29, 2018'
  end

  def clean_blog_post_meta
    ''.html_safe <<
      'Posted by ' <<
      h.content_tag(:a, author, href: '#') <<
      ' ' <<
      date
  end
end
