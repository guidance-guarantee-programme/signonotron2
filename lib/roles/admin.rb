module Roles
  class Admin
    def self.permitted_user_params
      [
        :uid,
        :name,
        :email,
        :password,
        :password_confirmation,
        :organisation_id,
        :unconfirmed_email,
        :confirmation_token,
        :require_2sv,
        { supported_permission_ids: [] },
      ]
    end

    def self.role_name
      'admin'
    end

    def self.level; 1; end

    def self.manageable_roles
      %w{normal organisation_admin admin}
    end
  end
end
