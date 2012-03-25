require 'spec_helper'

describe StoresController do

  before do
    controller.stub(:current_user).and_return(Factory(:user))
  end

  def valid_attributes
    { name: 'Book Store', user_id: controller.send(:current_user).id }
  end

  describe "GET index" do
    it "assigns all stores as @stores" do
      store = Store.create! valid_attributes
      get :index, {}
      assigns(:stores).should eq([store])
    end
  end

  describe "GET show" do
    it "assigns the requested store as @store" do
      store = Store.create! valid_attributes
      get :show, {:id => store.to_param}
      assigns(:store).should eq(store)
    end
  end

  describe "GET new" do
    it "assigns a new store as @store" do
      get :new, {}
      assigns(:store).should be_a_new(Store)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Store" do
        expect {
          post :create, {:store => valid_attributes}
        }.to change(Store, :count).by(1)
      end

      it "assigns a newly created store as @store" do
        post :create, {:store => valid_attributes}
        assigns(:store).should be_a(Store)
        assigns(:store).should be_persisted
      end

      it "redirects to the created store" do
        post :create, {:store => valid_attributes}
        response.should redirect_to(Store.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved store as @store" do
        # Trigger the behavior that occurs when invalid params are submitted
        Store.any_instance.stub(:save).and_return(false)
        post :create, {:store => {}}
        assigns(:store).should be_a_new(Store)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Store.any_instance.stub(:save).and_return(false)
        post :create, {:store => {}}
        response.should render_template("new")
      end
    end
  end

  describe "GET edit" do
    it "assigns a new store as @store" do
      store = Store.create! valid_attributes
      get :edit, {:id => store.to_param}
      assigns(:store).should eq(store)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested store" do
        store = Store.create! valid_attributes
        # Assuming there are no other categories in the database, this
        # specifies that the Store created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Store.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => store.to_param, :store => {'these' => 'params'}}
      end

      it "assigns the requested store as @store" do
        store = Store.create! valid_attributes
        put :update, {:id => store.to_param, :store => valid_attributes}
        assigns(:store).should eq(store)
      end

      it "redirects to the store" do
        store = Store.create! valid_attributes
        put :update, {:id => store.to_param, :store => valid_attributes}
        response.should redirect_to(store)
      end
    end

    describe "with invalid params" do
      it "assigns the store as @store" do
        store = Store.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Store.any_instance.stub(:save).and_return(false)
        put :update, {:id => store.to_param, :store => {}}
        assigns(:store).should eq(store)
      end

      it "re-renders the 'edit' template" do
        store = Store.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Store.any_instance.stub(:save).and_return(false)
        put :update, {:id => store.to_param, :store => {}}
        response.should render_template("edit")
      end
    end
  end
end