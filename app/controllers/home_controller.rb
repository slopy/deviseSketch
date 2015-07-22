class HomeController < ApplicationController
before_filter :authenticate_user!, only: [:private]

  def welcome
  end

  def private
  end

end
