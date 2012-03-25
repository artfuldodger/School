require 'spec_helper'

describe StoresController do

  before do
    controller.stub(:current_user).and_return(Factory(:user))
  end

  def valid_attributes
    { name: 'Book Store', user: controller.send(:current_user) }
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

  describe "GET edit" do
    it "assigns a new store as @store" do
      store = Store.create! valid_attributes
      get :edit, {:id => store.to_param}
      assigns(:store).should eq(store)
    end
  end
end