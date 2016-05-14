class MegustaController < ApplicationController
  before_action :set_megustum, only: [:show, :edit, :update, :destroy]

  # GET /megusta
  # GET /megusta.json
  def index
    @megusta = Megustum.all
  end

  # GET /megusta/1
  # GET /megusta/1.json
  def show
  end

  # GET /megusta/new
  def new
    @megustum = Megustum.new
  end

  # GET /megusta/1/edit
  def edit
  end

  # POST /megusta
  # POST /megusta.json
  def create
    @megustum = Megustum.new(megustum_params)

    respond_to do |format|
      if @megustum.save
        format.html { redirect_to @megustum, notice: 'Megustum was successfully created.' }
        format.json { render :show, status: :created, location: @megustum }
      else
        format.html { render :new }
        format.json { render json: @megustum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /megusta/1
  # PATCH/PUT /megusta/1.json
  def update
    respond_to do |format|
      if @megustum.update(megustum_params)
        format.html { redirect_to @megustum, notice: 'Megustum was successfully updated.' }
        format.json { render :show, status: :ok, location: @megustum }
      else
        format.html { render :edit }
        format.json { render json: @megustum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /megusta/1
  # DELETE /megusta/1.json
  def destroy
    @megustum.destroy
    respond_to do |format|
      format.html { redirect_to megusta_url, notice: 'Megustum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_megustum
      @megustum = Megustum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def megustum_params
      params.require(:megustum).permit(:megusta, :user_id, :grupo_id, :registro_id)
    end
end
