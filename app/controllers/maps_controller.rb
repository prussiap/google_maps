class MapsController < ApplicationController
  respond_to :json

  def new

    # @polystr = PolygonStringHolder.new
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    # coorg = params['polydata']['0'].collect {|x,i| x; i}[0].collect {|x, i| x; i}
    coorg = params['polydata'].collect {|x,i| {'name' => "poly #{x}", 'notes'=> '', 'coordinates' => i.collect {|x,i| i}}}

    if params['exclusiondata'] != nil
      exclus = params['exclusiondata'].collect {|x,i| {'name' => "poly #{x}", 'notes'=> '', 'coordinates' => i.collect {|x,i| i}}}
      @poly = PolygonStringHolder.create(coords: JSON.generate(coorg), exclusions: JSON.generate(exclus))
    else
      @poly = PolygonStringHolder.create(coords: JSON.generate(coorg))
    end
    respond_to do |format|
      p format
      format.html {
        redirect_to(action: 'show', id: @poly)
      }
      format.json {
        redirect_to(action: 'show', id: @poly)
      }
    end
  end

  def update
    @polystr = PolygonStringHolder.find(params[:id])

    coorg = params['polydata'].collect {|x,i| {'name' => "poly #{x}", 'notes'=> '', 'coordinates' => i.collect {|x,i| i}}}

    if params['exclusiondata'] != nil
      exclus = params['exclusiondata'].collect {|x,i| {'name' => "poly #{x}", 'notes'=> '', 'coordinates' => i.collect {|x,i| i}}}
      @poly = PolygonStringHolder.update_attributes(coords: JSON.generate(coorg), exclusions: JSON.generate(exclus))
    else
      @poly = PolygonStringHolder.update_attributes(coords: JSON.generate(coorg))
    end


  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
    @polystr = PolygonStringHolder.find(params[:id])
    respond_to do |format|
      format.html
      format.json do
        render json: jsondata(params[:id])
      end
    end

  end

  def jsondata(polyid)
    psh = PolygonStringHolder.find(polyid)
    coords = JSON.parse(psh.coords)
    ecls = JSON.parse(psh.exclusions)
    JSON.generate({'includedShapes' => coords, 'excludedShapes' => ecls})
  end
end
