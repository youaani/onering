require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe AdminUsersController do

  # This should return the minimal set of attributes required to create a valid
  # AdminUser. As you add validations to AdminUser, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {
      email: 'test@example.com'
    }
  end

  describe "GET index" do
    it "assigns all admin_users as @admin_users" do
      admin_user = AdminUser.create! valid_attributes
      get :index
      assigns(:admin_users).should eq(AdminUser.all)
    end
  end

  describe "GET show" do
    it "assigns the requested admin_user as @admin_user" do
      admin_user = AdminUser.create! valid_attributes
      get :show, :id => admin_user.id.to_s
      assigns(:admin_user).should eq(admin_user)
    end
  end

  describe "GET new" do
    it "assigns a new admin_user as @admin_user" do
      get :new
      assigns(:admin_user).should be_a_new(AdminUser)
    end
  end

  describe "GET edit" do
    it "assigns the requested admin_user as @admin_user" do
      admin_user = AdminUser.create! valid_attributes
      get :edit, :id => admin_user.id.to_s
      assigns(:admin_user).should eq(admin_user)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new AdminUser" do
        expect {
          post :create, :admin_user => valid_attributes
        }.to change(AdminUser, :count).by(1)
      end

      it "assigns a newly created admin_user as @admin_user" do
        post :create, :admin_user => valid_attributes
        assigns(:admin_user).should be_a(AdminUser)
        assigns(:admin_user).should be_persisted
      end

      it "redirects to the created admin_user" do
        post :create, :admin_user => valid_attributes
        response.should redirect_to(AdminUser.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved admin_user as @admin_user" do
        # Trigger the behavior that occurs when invalid params are submitted
        AdminUser.any_instance.stub(:save).and_return(false)
        post :create, :admin_user => {}
        assigns(:admin_user).should be_a_new(AdminUser)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        AdminUser.any_instance.stub(:save).and_return(false)
        post :create, :admin_user => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested admin_user" do
        admin_user = AdminUser.create! valid_attributes
        # Assuming there are no other admin_users in the database, this
        # specifies that the AdminUser created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        AdminUser.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => admin_user.id, :admin_user => {'these' => 'params'}
      end

      it "assigns the requested admin_user as @admin_user" do
        admin_user = AdminUser.create! valid_attributes
        put :update, :id => admin_user.id, :admin_user => valid_attributes
        assigns(:admin_user).should eq(admin_user)
      end

      it "redirects to the admin_user" do
        admin_user = AdminUser.create! valid_attributes
        put :update, :id => admin_user.id, :admin_user => valid_attributes
        response.should redirect_to(admin_user)
      end
    end

    describe "with invalid params" do
      it "assigns the admin_user as @admin_user" do
        admin_user = AdminUser.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        AdminUser.any_instance.stub(:save).and_return(false)
        put :update, :id => admin_user.id.to_s, :admin_user => {}
        assigns(:admin_user).should eq(admin_user)
      end

      it "re-renders the 'edit' template" do
        admin_user = AdminUser.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        AdminUser.any_instance.stub(:save).and_return(false)
        put :update, :id => admin_user.id.to_s, :admin_user => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested admin_user" do
      admin_user = AdminUser.create! valid_attributes
      expect {
        delete :destroy, :id => admin_user.id.to_s
      }.to change(AdminUser, :count).by(-1)
    end

    it "redirects to the admin_users list" do
      admin_user = AdminUser.create! valid_attributes
      delete :destroy, :id => admin_user.id.to_s
      response.should redirect_to(admin_users_url)
    end
  end

end