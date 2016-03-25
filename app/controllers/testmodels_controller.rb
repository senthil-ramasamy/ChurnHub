class TestmodelsController < ApplicationController
  before_action :set_testmodel, only: [:show, :edit, :update, :destroy]

  # GET /testmodels
  # GET /testmodels.json
  def index
    @testmodels = Testmodel.all
  end

  # GET /testmodels/1
  # GET /testmodels/1.json
  def show
  end

  # GET /testmodels/new
  def new
    @testmodel = Testmodel.new
  end

  # GET /testmodels/1/edit
  def edit
  end
  def testbutton
    %x(python pycode/predictive_modelling.py > pycode/pmodeloutput)
    puts "test button fucntion working"
    respond_to do |format|
      format.html { redirect_to trainmodels_path , notice:'the new data successfully predicted !' }
    end
  end 
 
  # POST /testmodels
  # POST /testmodels.json
  def create
    @testmodel = Testmodel.new(testmodel_params)

    respond_to do |format|
      if @testmodel.save
        format.html { redirect_to @testmodel, notice: 'Testmodel was successfully created.' }
        format.json { render :show, status: :created, location: @testmodel }
      else
        format.html { render :new }
        format.json { render json: @testmodel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /testmodels/1
  # PATCH/PUT /testmodels/1.json
  def update
    respond_to do |format|
      if @testmodel.update(testmodel_params)
        format.html { redirect_to @testmodel, notice: 'Testmodel was successfully updated.' }
        format.json { render :show, status: :ok, location: @testmodel }
      else
        format.html { render :edit }
        format.json { render json: @testmodel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testmodels/1
  # DELETE /testmodels/1.json
  def destroy
    @testmodel.destroy
    respond_to do |format|
      format.html { redirect_to testmodels_url, notice: 'Testmodel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testmodel
      @testmodel = Testmodel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def testmodel_params
      params.require(:testmodel).permit(:modid, :moddesc, :modname, :trainfile, :testfile, :addtnl, :modcheck, :trainmodel_id)
    end
end
