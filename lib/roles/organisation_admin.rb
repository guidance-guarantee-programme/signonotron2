module Roles
  class OrganisationAdmin
    def self.permitted_user_params # rubocop:disable Metrics/MethodLength
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
        :skip_invitation,
        { supported_permission_ids: [] }
      ]
    end

    def self.role_name
      'organisation_admin'
    end

    def self.level
      2
    end

    def self.manageable_roles
      ['normal']
    end
  end
end
