# app/controllers/contact_controller.rb
class ContactController < ApplicationController
  def index
  end

  def create
    if contact_params.values_at(:name, :email, :message).any?(&:blank?)
      flash[:alert] = "Please fill out your name, email, and message."
      return redirect_to contact_path
    end

    begin
      ContactMailer.contact_email(
        name:    contact_params[:name],
        email:   contact_params[:email],
        message: contact_params[:message]
      ).deliver_now

      flash[:notice] = "Thanks! Your message has been sent."
    rescue => e
      Rails.logger.error("Contact mail failed: #{e.class} - #{e.message}")
      flash[:alert] = "Sorry, there was a problem sending your message."
    end

    redirect_to contact_path
  end

  private

  # Strong params for the simple (non-model) form
  def contact_params
    params.permit(:name, :email, :message, :authenticity_token)
  end
end
