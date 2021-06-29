# frozen_string_literal: true

# This class represents the Users Controller.
class UsersController < ApplicationController
  before_action :authenticate_user!

  def info
    @subscription = current_user.subscription
  end
end
