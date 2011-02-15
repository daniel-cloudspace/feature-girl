class ScenariosController < ApplicationController
  # GET /scenarios
  # GET /scenarios.xml
  def index
    @scenarios = Scenario.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @scenarios }
    end
  end

  # GET /scenarios/1
  # GET /scenarios/1.xml
  def show
    @scenario = Scenario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @scenario }
    end
  end

  # GET /scenarios/new
  # GET /scenarios/new.xml
  def new
    @scenario = Scenario.new
    @features = Feature.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @scenario }
    end
  end

  # GET /scenarios/1/edit
  def edit
    @scenario = Scenario.find(params[:id])
    @features = Feature.all
  end

  # POST /scenarios
  # POST /scenarios.xml
  def create
    @scenario = Scenario.new(params[:scenario])

    respond_to do |format|
      if @scenario.save
        format.html { redirect_to(@scenario, :notice => 'Scenario was successfully created.') }
        format.xml  { render :xml => @scenario, :status => :created, :location => @scenario }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @scenario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /scenarios/1
  # PUT /scenarios/1.xml
  def update
    @scenario = Scenario.find(params[:id])

    respond_to do |format|
      if @scenario.update_attributes(params[:scenario])
        format.html { redirect_to(@scenario, :notice => 'Scenario was successfully updated.') }
        format.xml  { head :ok }
        format.json { render :json => { :success => true } }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @scenario.errors, :status => :unprocessable_entity }
        format.json { render :json => { :success => false } }
      end
    end
  end

  # DELETE /scenarios/1
  # DELETE /scenarios/1.xml
  def destroy
    @scenario = Scenario.find(params[:id])
    @scenario.destroy

    respond_to do |format|
      format.html { redirect_to(scenarios_url) }
      format.xml  { head :ok }
    end
  end

  # GET /network
  # get a jquery-draggable network of scenarios and tags
  def network
    @scenarios = Scenario.all(:include => :tags)
    @tags = @scenarios.collect{|s| s.tags}.flatten.uniq
  end

  # save tag to scenario by id
  # not sure that this is the most succint way to do this
  def tag
    @scenario = Scenario.find(params[:id]);
    tl = @scenario.tag_list
    tl << Tag.find_by_id(params[:tag]).name;
    @scenario.tag_list = tl
    respond_to do |format|
      if @scenario.update_attributes(@scenario)
        format.json { render :json => { :success => true } }
      else
        format.json { render :json => { :success => false} }
      end
    end
  end

  def untag
    tagging = Tagging.find_by_taggable_id_and_tag_id(params[:id], params[:tag])
    respond_to do |format|
      if tagging.destroy
        format.json { render :json => { :success => true } }
      else
        format.json { render :json => { :success => false} }
      end
    end
  end
end
