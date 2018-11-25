# frozen_string_literal: true

class ViewPostPreview
  include ActionView::Helpers::TagHelper

  attr_accessor :model

  def initialize(post:)
    @model = post
  end

  def title
    model.title.presence || 'Man must explore, and this is exploration at its greatest'
  end

  def subtitle
    model.subtitle.presence || 'Problems look mighty small from 150 miles up'
  end

  def author
    model.author.name.presence || 'Start Bootstrap'
  end

  def date
    model.date.strftime('on %B %d, %Y').presence || 'on Semptember 29, 2018'
  end

  def clean_blog_post_meta
    ''.html_safe <<
      'Posted by ' <<
      content_tag(:a, author, href: '#') <<
      ' ' <<
      date
  end
end
