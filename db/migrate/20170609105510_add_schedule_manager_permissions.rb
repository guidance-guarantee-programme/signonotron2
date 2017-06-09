require_relative '../../app/models/enhancements/application'

class AddScheduleManagerPermissions < ActiveRecord::Migration
  def change
    planner = Doorkeeper::Application.find_by!(name: 'Planner Staging')
    schedule_manager_permission = planner.supported_permissions.find_by!(name: 'schedule_manager')

    say 'Removing signin permission to old summary document generator for all non admin users'
    users = planner
              .supported_permissions
              .find_by(name: 'booking_manager')
              .user_application_permissions
              .collect(&:user)

    users.each do |user|
      if user.suspended?
        say "user '#{user.name}' is suspended, skipping", true
      else
        say "creating 'schedule_manager' permission for user '#{user.name}'", true
        user.application_permissions.find_or_create_by!(
          application: planner,
          supported_permission: schedule_manager_permission
        )
      end
    end
  end
end
