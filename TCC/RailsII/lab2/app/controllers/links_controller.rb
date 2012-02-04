class LinksController < ApplicationController
  before_filter :get_link, except: [:index, :new, :create]
  before_filter :require_user, except: [:index, :show]
  before_filter :require_moderator_or_own_link, only: [:edit, :update]
  before_filter :require_admin_or_own_link, only: [:destroy]

  # GET /links
  # GET /links.json
  def index
    @links = Link.paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @links }
    end
  end

  # GET /links/1
  # GET /links/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @link }
    end
  end

  # GET /links/new
  # GET /links/new.json
  def new
    @link = Link.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @link }
    end
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(params[:link])
    @link.user = current_user

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render json: @link, status: :created, location: @link }
      else
        format.html { render action: "new" }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /links/1
  # PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update_attributes(params[:link])
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy

    respond_to do |format|
      format.html { redirect_to links_url }
      format.json { head :ok }
    end
  end

  def vote
    if current_user.voted_for_links.include?(@link)
      current_user.link_votes.find_by_link_id(@link.id).delete
    else
      current_user.link_votes.create(link: @link)
    end

    respond_to do |format|
      # format.html { redirect_to @link }
      format.js
    end
  end

  private

  def get_link
    @link = Link.find(params[:id])
  end

  def require_moderator_or_own_link
    redirect_to :back unless @link.user == current_user or current_user.is_at_least_a_moderator?
  end

  def require_admin_or_own_link
    redirect_to :back unless @link.user == current_user or current_user.is_admin?
  end
end
