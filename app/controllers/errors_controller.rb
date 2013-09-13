class ErrorsController < ApplicationController
  def error403
    raise CanCan::AccessDenied.new
  end

  def error404
    raise ActiveRecord::RecordNotFound.new
  end

  def error500
    raise Exception.new
  end
end

