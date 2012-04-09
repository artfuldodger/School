require 'spec_helper'

describe WidgetsController do

  def valid_attributes
    {name: 'Stuff', description: 'and things'}
  end
  
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all widgets as @widgets" do
      widget = Widget.create! valid_attributes
      xhr :get, :index, {}, valid_session
      assigns(:widgets).should eq([widget])
    end
  end

  describe "GET show" do
    it "assigns the requested widget as @widget" do
      widget = Widget.create! valid_attributes
      xhr :get, :show, {:id => widget.to_param}, valid_session
      assigns(:widget).should eq(widget)
    end
  end

  describe "GET new" do
    it "assigns a new widget as @widget" do
      xhr :get, :new, {}, valid_session
      assigns(:widget).should be_a_new(Widget)
    end
  end

  describe "GET edit" do
    it "assigns the requested widget as @widget" do
      widget = Widget.create! valid_attributes
      xhr :get, :edit, {:id => widget.to_param}, valid_session
      assigns(:widget).should eq(widget)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Widget" do
        expect {
          xhr :post, :create, {:widget => valid_attributes}, valid_session
        }.to change(Widget, :count).by(1)
      end

      it "assigns a newly created widget as @widget" do
        xhr :post, :create, {:widget => valid_attributes}, valid_session
        assigns(:widget).should be_a(Widget)
        assigns(:widget).should be_persisted
      end

      it "renders show for the created widget" do
        xhr :post, :create, {:widget => valid_attributes}, valid_session
        response.should render_template("show")
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved widget as @widget" do
        # Trigger the behavior that occurs when invalid params are submitted
        Widget.any_instance.stub(:save).and_return(false)
        xhr :post, :create, {:widget => {}}, valid_session
        assigns(:widget).should be_a_new(Widget)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Widget.any_instance.stub(:save).and_return(false)
        xhr :post, :create, {:widget => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested widget" do
        widget = Widget.create! valid_attributes
        Widget.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        xhr :put, :update, {:id => widget.to_param, :widget => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested widget as @widget" do
        widget = Widget.create! valid_attributes
        xhr :put, :update, {:id => widget.to_param, :widget => valid_attributes}, valid_session
        assigns(:widget).should eq(widget)
      end

      it "renders the show for the widget" do
        widget = Widget.create! valid_attributes
        xhr :put, :update, {:id => widget.to_param, :widget => valid_attributes}, valid_session
        response.should render_template("show")
      end
    end

    describe "with invalid params" do
      it "assigns the widget as @widget" do
        widget = Widget.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Widget.any_instance.stub(:save).and_return(false)
        xhr :put, :update, {:id => widget.to_param, :widget => {}}, valid_session
        assigns(:widget).should eq(widget)
      end

      it "re-renders the 'edit' template" do
        widget = Widget.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Widget.any_instance.stub(:save).and_return(false)
        xhr :put, :update, {:id => widget.to_param, :widget => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested widget" do
      widget = Widget.create! valid_attributes
      expect {
        xhr :delete, :destroy, {:id => widget.to_param}, valid_session
      }.to change(Widget, :count).by(-1)
    end

    it "renders the destroy js" do
      widget = Widget.create! valid_attributes
      xhr :delete, :destroy, {:id => widget.to_param}, valid_session
      response.should render_template "destroy"
    end
  end

end
