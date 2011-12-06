class SeriesController < ApplicationController
  def index
    @series = Series.find(:all, :include => [:episodes])
  end
  
  def new
    @series = Series.new
  end

  def create
    @series = Series.new(params[:series])

    respond_to do |format|
      if @series.save
        format.html  { redirect_to series_episodes_path(@series), notice: 'Series was successfully created.' }
      else
        format.html { render :action => :new }
      end
    end
  end

  def edit
    @series = Series.find(params[:id])
  end

  def update
    @series = Series.find(params[:id])

    respond_to do |format|
      if @series.update_attributes(params[:series])
        format.html  { redirect_to series_episodes_path(@series), notice: 'Series was successfully updated.'  }
      else
        format.html { render :action => :edit }
      end
    end    
  end

  def destroy
    @series = Series.find(params[:id])
    @series.destroy
   
    respond_to do |format|
      format.html { redirect_to series_index_url }
    end
  end

end