require 'spec_helper'

describe ItemsController do

  before do
    @user = Factory(:user)
    @store = Factory(:store)
  end

  def valid_attributes
    { store_id: @store.id, name: 'Stuff and things' }
  end

  def valid_session
    { user_id: @user.id }
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Item" do
        expect {
          post :create, {:store_id => @store.id, :item => valid_attributes}, valid_session
        }.to change(Item, :count).by(1)
      end

      it "assigns a newly created item as @item" do
        post :create, {:store_id => @store.id, :item => valid_attributes}, valid_session
        assigns(:item).should be_a(Item)
        assigns(:item).should be_persisted
      end

      it "redirects to the associated store" do
        post :create, {:store_id => @store.id, :item => valid_attributes}, valid_session
        response.should redirect_to(@store)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved item as @item" do
        # Trigger the behavior that occurs when invalid params are submitted
        Item.any_instance.stub(:save).and_return(false)
        post :create, {:store_id => @store.id, :item => {}}, valid_session
        assigns(:item).should be_a_new(Item)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Item.any_instance.stub(:save).and_return(false)
        post :create, {:store_id => @store.id, :item => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

end
