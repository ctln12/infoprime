# frozen_string_literal: true

# Configures the parent class to the Devise controllers for Hotwire & Turbo on sign up
class TurboDeviseController < ApplicationController
  # Configures the responders gem for Hotwire & Turbo
  class Responder < ActionController::Responder
    def to_turbo_stream
      controller.render(options.merge(formats: :html))
    rescue ActionView::MissingTemplate => e
      raise e if get?

      if has_errors? && default_action
        render rendering_options.merge(formats: :html, status: :unprocessable_entity)
      else
        redirect_to navigation_location
      end
    end
  end

  self.responder = Responder
  respond_to :html, :turbo_stream
end
