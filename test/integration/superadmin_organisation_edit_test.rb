require "test_helper"

class SuperAdminApplicationEditTest < ActionDispatch::IntegrationTest
  include ActiveJob::TestHelper

  context "logged in as an superadmin" do
    setup do
      @organisation = create(:organisation)

      @superadmin = create(:superadmin_user)
      visit new_user_session_path
      signin_with(@superadmin)
      within("ul.nav") do
        click_link "Organisations"
      end
    end

    should "be able to update the organisation name" do
      click_link @organisation.name

      # edit organisation name
      fill_in "Name", with: 'New organisation name'
      click_button "Update Organisation"

      @organisation.reload
      assert_equal @organisation.name, 'New organisation name'
    end

    should "be able set a parent organisation" do
      parent_organisation = create(:organisation)

      click_link @organisation.name

      # set organisation parent
      select parent_organisation.name, from: "Parent Organisation"
      click_button "Update Organisation"

      @organisation.reload
      assert_equal @organisation.parent, parent_organisation
    end
  end
end
