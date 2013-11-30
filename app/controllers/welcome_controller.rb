class WelcomeController < ApplicationController

  def index
    render params[:page] || 'index'
  end

end
