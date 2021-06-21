# frozen_string_literal: true

class AddSubscriptionToPreviousUsers < ActiveRecord::Migration[6.0]
  def up
    User.all.each(&:create_subscription)
  end
end
