class ApplicationController < ActionController::Base

  def status_check(info)
    if info == nil
      false
    else
      info
    end
  end
end
