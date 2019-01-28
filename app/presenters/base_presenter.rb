# frozen_string_literal: true

class BasePresenter < SimpleDelegator
  attr_reader :model, :params

  def initialize(model, view, **params)
    @view = view
    @model = model
    @params = params || {}
  end

  def h
    @view
  end
end
