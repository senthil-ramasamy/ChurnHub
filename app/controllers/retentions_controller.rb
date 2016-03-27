class RetentionsController < ApplicationController
  before_action :set_retention, only: [:show, :edit, :update, :destroy]

  # GET /retentions
  # GET /retentions.json
  def index
    @retentions = Retention.all
  end

  # GET /retentions/1
  # GET /retentions/1.json
  def show
  end

  # GET /retentions/new
  def new
    @retention = Retention.new
  end

  # GET /retentions/1/edit
  def edit
  end

  def mailsend
    myid = Retention.find(params[:id]).trainmodel_id
    myfile = Trainmodel.find(myid).trainfile
    off1 = Retention.find(params[:id]).offer1
    off2 = Retention.find(params[:id]).offer2
    off3 = Retention.find(params[:id]).offer3
    %x(python mailsend.py #{off1} #{off2} #{off3})
    %x(python massemail.py -m example-template.md -c maildataset.csv )
  end
  # POST /retentions
  # POST /retentions.json
  def create
    @retention = Retention.new(retention_params)

    respond_to do |format|
      if @retention.save
        format.html { redirect_to @retention, notice: 'Retention was successfully created.' }
        format.json { render :show, status: :created, location: @retention }
      else
        format.html { render :new }
        format.json { render json: @retention.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /retentions/1
  # PATCH/PUT /retentions/1.json
  def update
    respond_to do |format|
      if @retention.update(retention_params)
        format.html { redirect_to @retention, notice: 'Retention was successfully updated.' }
        format.json { render :show, status: :ok, location: @retention }
      else
        format.html { render :edit }
        format.json { render json: @retention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /retentions/1
  # DELETE /retentions/1.json
  def destroy
    @retention.destroy
    respond_to do |format|
      format.html { redirect_to retentions_url, notice: 'Retention was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_retention
      @retention = Retention.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def retention_params
      params.require(:retention).permit(:retid, :trainmodel_id, :offer1, :offer2, :offer3, :range, :modcheck)
    end
end
