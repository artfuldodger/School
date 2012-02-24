class AnswersController < ApplicationController
  before_filter :get_category
  before_filter :get_question

  before_filter :require_user, except: [:index, :show]
  before_filter :require_admin_user, only: [:edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @answers }
    end
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
    @answer = Answer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @answer }
    end
  end

  # GET /answers/new
  # GET /answers/new.json
  def new
    @answer = Answer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @answer }
    end
  end

  # GET /answers/1/edit
  def edit
    @answer = @question.answers.find(params[:id])
  end

  # POST /answers
  # POST /answers.json
  def create
    params[:answer][:question_id] = @question.id
    params[:answer][:user_id] = current_user.id

    @answer = @question.answers.new(params[:answer])

    respond_to do |format|
      if @answer.save
        format.html { redirect_to [@category, @question], notice: 'Answer was successfully created.' }
        format.json { render json: @answer, status: :created, location: @answer }
      else
        format.html { render action: "new" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /answers/1
  # PUT /answers/1.json
  def update
    @answer = @question.answers.find(params[:id])

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to [@category, @question], notice: 'Answer was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer = @question.answers.find(params[:id])
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to [@category, @question] }
      format.json { head :ok }
    end
  end

  private
  def get_category
    @category = Category.find(params[:category_id])
  end

  def get_question
    @question = @category.questions.find(params[:question_id])
  end
end
