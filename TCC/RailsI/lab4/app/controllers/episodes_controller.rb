class EpisodesController < ApplicationController
  def index
    @episodes = Episode.all
  end

  def show
    @episode = Episode.find(params[:id])
  end

  def new
    @episode = Episode.new
  end

  def create
    @episode = Episode.new(params[:episode])

    respond_to do |format|
      if @episode.save
        format.html  { redirect_to @episode, notice: 'Episode was successfully created.' }
      else
        format.html { render :action => :new }
      end
    end
  end

  def edit
    @episode = Episode.find(params[:id])
  end

  def update
    @episode = Episode.find(params[:id])

    respond_to do |format|
      if @episode.update_attributes(params[:episode])
        format.html  { redirect_to @episode, notice: 'Episode was successfully updated.'  }
      else
        format.html { render :action => :edit }
      end
    end    
  end

  def destroy
    @episode = Episode.find(params[:id])
    @episode.destroy
   
    respond_to do |format|
      format.html { redirect_to episodes_url }
    end
  end

end
