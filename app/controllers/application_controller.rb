class ApplicationController < ActionController::Base
  def app
  end
  include Response
  include ExceptionHandler
end
