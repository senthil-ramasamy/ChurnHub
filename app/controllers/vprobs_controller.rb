class VprobsController < ApplicationController
  before_action :set_vprob, only: [:show, :edit, :update, :destroy]

  # GET /vprobs
  # GET /vprobs.json
  def index
    @vprobs = Vprob.all
  end

  # GET /vprobs/1
  # GET /vprobs/1.json
  def show
  end

  # GET /vprobs/new
  def new
    @vprob = Vprob.new
  end

  # GET /vprobs/1/edit
  def edit
  end

  # POST /vprobs
  # POST /vprobs.json
  def create
    @prob = Prob.find(params[:prob_id])
    @vprob = @prob.vprobs.new(vprob_params)

    respond_to do |format|
      if @vprob.save
        format.html { redirect_to @vprob.prob, notice: 'Vprob was successfully created.' }
        format.json { render :show, status: :created, location: @vprob }
      else
        format.html { render :new }
        format.json { render json: @vprob.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vprobs/1
  # PATCH/PUT /vprobs/1.json
  def update
    respond_to do |format|
      if @vprob.update(vprob_params)
        format.html { redirect_to @vprob.prob, notice: 'Vprob was successfully updated.' }
        format.json { render :show, status: :ok, location: @vprob }
      else
        format.html { render :edit }
        format.json { render json: @vprob.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vprobs/1
  # DELETE /vprobs/1.json
  def destroy
    @vprob.destroy
    respond_to do |format|
      format.html { redirect_to vprobs_url, notice: 'Vprob was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vprob
      @vprob = Vprob.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vprob_params
      params.require(:vprob).permit(:pvname, :pversion, :pvauthor, :pvid, :pvdate, :pvinteger, :prob_id)
    end
end
