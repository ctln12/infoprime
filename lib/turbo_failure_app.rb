# frozen_string_literal: true

# Handles Warden failure app response for Hotwire & Turbo on log in with Devise
class TurboFailureApp < Devise::FailureApp
  def respond
    if request_format == :turbo_stream
      redirect
    else
      super
    end
  end

  def skip_format?
    %w[html turbo_stream */*].include? request_format.to_s
  end
end
