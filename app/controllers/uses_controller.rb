class UsesController < ApplicationController
  def new
  @user = User.new
  end
end
