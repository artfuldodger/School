class LinkCommentsController < ApplicationController
  # GET /link_comments
  # GET /link_comments.json
  def index
    @link_comments = LinkComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @link_comments }
    end
  end

  # GET /link_comments/1
  # GET /link_comments/1.json
  def show
    @link_comment = LinkComment.find(params[:id])

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
  def edit
    @link_comment = LinkComment.find(params[:id])
  end

  # POST /link_comments
  # POST /link_comments.json
  def create
    @link_comment = LinkComment.new(params[:link_comment])

    respond_to do |format|
      if @link_comment.save
        format.html { redirect_to @link_comment, notice: 'Link comment was successfully created.' }
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
    @link_comment = LinkComment.find(params[:id])

    respond_to do |format|
      if @link_comment.update_attributes(params[:link_comment])
        format.html { redirect_to @link_comment, notice: 'Link comment was successfully updated.' }
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
    @link_comment = LinkComment.find(params[:id])
    @link_comment.destroy

    respond_to do |format|
      format.html { redirect_to link_comments_url }
      format.json { head :ok }
    end
  end
end
