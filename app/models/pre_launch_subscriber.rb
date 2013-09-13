class PreLaunchSubscriber < ActiveRecord::Base
  comma do
    id
    email
    created_at
  end
end

