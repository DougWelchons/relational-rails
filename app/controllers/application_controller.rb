class ApplicationController < ActionController::Base

  def status_check(info)
    if info == "0" || info == nil
      false
    else
      true
    end
  end
end
