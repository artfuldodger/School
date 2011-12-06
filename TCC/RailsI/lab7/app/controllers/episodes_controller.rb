class EpisodesController < ApplicationController

  before_filter :load_series
  
  def load_series
    @series = Series.find( params[:series_id] )
  end

  def index
    @episodes = @series.episodes.all
  end

  def show
    @episode = Episode.find(params[:id])
  end

  def new
    @episode = Episode.new
    @episode.series = Series.find_by_title(params[:series]) if Series.all.map(&:title).include?(params[:series])
  end

  def create
    @episode = @series.episodes.build(params[:episode])

    respond_to do |format|
      if @episode.save
        format.html  { redirect_to [@series, @episode], notice: 'Episode was successfully created.' }
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
        format.html  { redirect_to [@series,@episode], notice: 'Episode was successfully updated.'  }
      else
        format.html { render :action => :edit }
      end
    end    
  end

  def destroy
    @episode = Episode.find(params[:id])
    @episode.destroy
   
    respond_to do |format|
      format.html { redirect_to series_episodes_url(@series) }
    end
  end

end
