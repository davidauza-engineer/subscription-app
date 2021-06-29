# frozen_string_literal: true

# This class represents a controller for Stripe Checkout Sessions.
class SessionsController < ApplicationController

  def create
    session = Stripe::Checkout::Session.create(
      success_url: 'http://localhost:3000/success.html?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: 'http://localhost:3000/users/info',
      payment_method_types: ['card'],
      mode: 'subscription',
      line_items: [{ quantity: 1, price: params['priceId'] }]
    )

    render json: { sessionId: session.id }
  rescue StandardError => e
    render json: { error: { message: e.error.message } }, status: 400, headers: { 'Content-Type' => 'application/json' }
  end

  def success
    current_user.subscription.update(active: true)
    redirect_to users_info_url
  end
end
