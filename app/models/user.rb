class User < ActiveRecord::Base
  has_many :orders

  def self.find_or_create_by_auth(auth_data)
    # Uses Rails dynamic finder ability
    # Attempt to find a match based on the following parameters
    # If found return it, else create a new record
    # Use provider and uid to search for
    find_or_create_by_provider_and_uid(auth_data["provider"], auth_data["uid"],
                                      :name => auth_data["info"]["name"])
  end
end
