class Admin < ActiveRecord::Base
  authenticates_with_sorcery!
  validates_confirmation_of :password, message: "- Passwords must match",
    if: :password
end
