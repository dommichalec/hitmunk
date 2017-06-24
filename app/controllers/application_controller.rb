class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def calculate_points_for(object, point_value)
    object.update_attributes(points: object.points + point_value)
  end
end
