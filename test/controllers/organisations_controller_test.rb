require 'test_helper'

class OrganisationsControllerTest < ActionController::TestCase
  def self.test_access(&block)
    should 'allow access for superadmin' do
      user = create(:superadmin_user)
      sign_in user
      instance_eval(&block)
      assert_response 200
    end

    should 'allow access for admin' do
      user = create(:admin_user)
      sign_in user
      instance_eval(&block)
      assert_response 200
    end

    should 'not allow access for organisation admin' do
      user = create(:organisation_admin)
      sign_in user
      instance_eval(&block)
      assert_redirected_to root_url
    end

    should 'not allow access for normal user' do
      user = create(:user)
      sign_in user
      instance_eval(&block)
      assert_redirected_to root_url
    end
  end

  context '#index' do
    setup do
      @user = create(:admin_user)
      sign_in @user
    end

    context "GET index" do
      setup do
        create(:organisation, name: "Ministry of Funk")
      end

      should "list organisations" do
        get :index
        assert_response 200
        assert_select "td", "Ministry of Funk"
      end
    end
  end

  context '#new' do
    test_access do
      get :new
    end
  end

  context '#create' do
    test_access do
      post :create, organisation: { name: 'test' }
    end
  end

  context '#edit' do
    test_access do
      organisation = create(:organisation)
      get :edit, id: organisation.id
    end
  end

  context '#update' do
    test_access do
      organisation = create(:organisation)
      put :update, id: organisation.id, organisation: { slug: '' }
    end
  end
end
