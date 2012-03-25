class ItemsController < ApplicationController

  before_filter :require_user
  before_filter :get_store, except: [:toggle_done]

  # GET /items/new
  # GET /items/new.json
  def new
    @item = @store.items.new

    respond_to do |format|
      format.html # new.html.erb
      format.js
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
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    @item = @store.items.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.js
    end
  end

  def toggle_done
    @item = Item.find(params[:id])
    @item.update_attribute(:done, !@item.done?)
    @item.reload
    
    respond_to do |format|
      format.js
    end
  end
  
  private
  def get_store
    @store = Store.find(params[:store_id])
  end
end