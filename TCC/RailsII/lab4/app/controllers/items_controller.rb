class ItemsController < ApplicationController

  before_filter :require_user
  before_filter :get_store

  # GET /items/new
  # GET /items/new.json
  def new
    @item = @store.items.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # POST /items
  # POST /items.json
  def create
    @item = @store.items.new(params[:item])
    
    respond_to do |format|
      if @item.save
        format.html { redirect_to @store, notice: 'item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "item" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    
  end
  
  private
  def get_store
    @store = Store.find(params[:store_id])
  end
end