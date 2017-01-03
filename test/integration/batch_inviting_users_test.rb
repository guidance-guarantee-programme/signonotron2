require 'test_helper'

class BatchInvitingUsersTest < ActionDispatch::IntegrationTest
  include ActiveJob::TestHelper

  should 'admin user can create users whose details are specified in a CSV file' do
    application = create(:application)
    user = create(:user, role: 'admin')

    perform_batch_invite_with_user(user, application)

    assert_equal 'fred@example.com', last_email.to[0]
    assert_match 'Please confirm your account', last_email.subject
  end

  should 'existing user permissions are appended - not overwritten' do
    old_application = create(:application)
    new_application = create(:application)

    fred = create(:user, email: 'fred@example.com')
    fred.grant_application_permission(old_application, ['signin'])

    user = create(:user, role: 'admin')

    perform_batch_invite_with_user(user, new_application, last_email)

    fred.reload
    assert fred.has_access_to?(old_application)
    assert fred.has_access_to?(new_application)
  end

  should 'email case and spacing are ignored' do
    old_application = create(:application)
    new_application = create(:application)

    fred = create(:user, email: 'fred@example.com')
    fred.grant_application_permission(old_application, ['signin'])

    user = create(:user, role: 'admin')

    perform_batch_invite_with_user(user, new_application, false, File.join(::Rails.root, 'test', 'fixtures', 'users-bad-cased-emails.csv'))

    fred.reload
    assert fred.has_access_to?(old_application)
    assert fred.has_access_to?(new_application)
  end

  should 'organisation admin user can create users whose details are specified in a CSV file' do
    application = create(:application)
    user = create(:user_in_organisation, role: 'organisation_admin')
    user.grant_application_permission(application, ['signin'])

    perform_batch_invite_with_user(user, application)
  end

  def perform_batch_invite_with_user(user, application, expect_email = true, path = File.join(::Rails.root, 'test', 'fixtures', 'users.csv'))
    perform_enqueued_jobs do
      visit root_path
      signin_with(user)

      visit new_batch_invitation_path
      attach_file('Choose a CSV file of users with names and email addresses', path)
      check "Has access to #{application.name}?"
      click_button 'Create users and send emails'

      assert_response_contains('Creating a batch of users')
      assert_response_contains('1 users processed')

      invited_user = User.find_by_email('fred@example.com')
      assert_not_nil invited_user
      assert invited_user.has_access_to?(application)

      return unless expect_email

      assert_match /noreply-signon-development@.+\.gov\.uk/, last_email.from[0]
      assert_equal nil, last_email.reply_to[0]

      assert_equal "fred@example.com", last_email.to[0]
      assert_match 'Please confirm your account', last_email.subject
    end
  end
end
