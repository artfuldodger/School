class StoresController < ApplicationController

  before_filter :require_user

  # GET /stores
  # GET /stores.json
  def index
    @stores = current_user.stores
    @keyboard_shortcuts = @stores.map(&:name).map { |name| name[0] }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stores }
    end
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
    @store = current_user.stores.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @store }
    end
  end

  # GET /stores/new
  # GET /stores/new.json
  def new
    @store = Store.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @store }
    end
  end

  def edit
    @store = current_user.stores.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @store }
    end
  end

  def update
    @store = Store.find(params[:id])

    respond_to do |format|
      if @store.update_attributes(params[:store])
        format.html { redirect_to @store, notice: 'Store was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = current_user.stores.new(params[:store])
    
    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'Store was successfully created.' }
        format.json { render json: @store, status: :created, location: @store }
      else
        format.html { render action: "new" }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if current_user.stores.find_by_id(params[:id]).try(:delete)
      redirect_to stores_url, notice: 'Store was successfully deleted.'
    else
      redirect_to stores_url, notice: 'You cannot delete that store.'
    end
  end

end