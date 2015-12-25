class SunamisController < ApplicationController
  before_action :set_sunami, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except =>[:index]
  # GET /sunamis
  # GET /sunamis.json
  def index
    @sunamis = Sunami.all
    @sunamis = Sunami.page(params[:page]).per(5)
  end

  # GET /sunamis/1
  # GET /sunamis/1.json
  def show
  end

  # GET /sunamis/new
  def new
    @sunami = Sunami.new
  end

  # GET /sunamis/1/edit
  def edit
  end

  # POST /sunamis
  # POST /sunamis.json
  def create
    @sunami = Sunami.new(sunami_params)

    respond_to do |format|
      if @sunami.save
        format.html { redirect_to @sunami, notice: 'Sunami was successfully created.' }
        format.json { render :show, status: :created, location: @sunami }
      else
        format.html { render :new }
        format.json { render json: @sunami.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sunamis/1
  # PATCH/PUT /sunamis/1.json
  def update
    respond_to do |format|
      if @sunami.update(sunami_params)
        format.html { redirect_to @sunami, notice: 'Sunami was successfully updated.' }
        format.json { render :show, status: :ok, location: @sunami }
      else
        format.html { render :edit }
        format.json { render json: @sunami.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sunamis/1
  # DELETE /sunamis/1.json
  def destroy
    @sunami.destroy
    respond_to do |format|
      format.html { redirect_to sunamis_url, notice: 'Sunami was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sunami
      @sunami = Sunami.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sunami_params
      params.require(:sunami).permit(:title, :box, :time,:category_id)
    end
end
