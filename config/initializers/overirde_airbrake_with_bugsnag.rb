Airbrake

module Airbrake
  class << self
    def notify(exception, opts = {})
      Bugsnag.(exception, nil, opts)
    end
  end
end
