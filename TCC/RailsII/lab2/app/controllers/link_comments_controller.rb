class LinkCommentsController < ApplicationController
  before_filter :get_link, except: [:index, :new]
  before_filter :get_link_comment, except: [:index, :new, :create]
  before_filter :require_user, except: [:index, :show]
  before_filter :ensure_user_should_be_able_to_edit_comment, only: [:edit, :update]
  before_filter :ensure_user_should_be_able_to_delete_comment, only: [:destroy]

  # GET /link_comments
  # GET /link_comments.json
  def index
    @link_comments = @link.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @link_comments }
    end
  end

  # GET /link_comments/1
  # GET /link_comments/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @link_comment }
    end
  end

  # GET /link_comments/new
  # GET /link_comments/new.json
  def new
    @link_comment = LinkComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @link_comment }
    end
  end

  # GET /link_comments/1/edit
  def edit; end

  # POST /link_comments
  # POST /link_comments.json
  def create
    params[:link_comment][:user_id] = current_user.id
    @link_comment = @link.link_comments.create(params[:link_comment])

    respond_to do |format|
      if @link_comment
        format.html { redirect_to @link, notice: 'Link comment was successfully created.' }
        format.json { render json: @link_comment, status: :created, location: @link_comment }
      else
        format.html { render action: "new" }
        format.json { render json: @link_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /link_comments/1
  # PUT /link_comments/1.json
  def update
    respond_to do |format|
      if @link_comment.update_attributes(params[:link_comment])
        format.html { redirect_to @link, notice: 'Link comment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @link_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /link_comments/1
  # DELETE /link_comments/1.json
  def destroy
    @link_comment.destroy

    respond_to do |format|
      format.html { redirect_to @link }
      format.json { head :ok }
      format.js
    end
  end

  private
  def get_link
    @link = Link.find(params[:link_id])
  end

  def get_link_comment
    @link_comment = @link.link_comments.find(params[:id])
  end

  def ensure_user_should_be_able_to_edit_comment
    current_user && (@link_comment.user == current_user || current_user.is_at_least_a_moderator?)
  end

  def ensure_user_should_be_able_to_delete_comment
    current_user && (@link_comment.user == current_user || current_user.is_admin?)
  end
end
