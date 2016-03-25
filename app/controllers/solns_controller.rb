class SolnsController < ApplicationController
  before_action :set_soln, only: [:show, :edit, :update, :destroy]

  before_action :set_soln_and_version, only: [:diff, :rollback, :destroy]
  # GET /solns
  # GET /solns.json
  def index
    @solns = Soln.all
  end

  # GET /solns/1
  # GET /solns/1.json
  def show
  end

  # GET /solns/new
  def new
    @soln = Soln.new
  end

  # GET /solns/1/edit
  def edit
  end

  # POST /solns
  # POST /solns.json
  def create
    @prob = Prob.find(params[:prob_id])
    @soln = @prob.solns.new(soln_params)

    respond_to do |format|
      if @soln.save
        format.html { redirect_to @soln.prob, notice: 'Soln was successfully created.' }
        format.json { render :show, status: :created, location: @soln }
      else
        format.html { render :new }
        format.json { render json: @soln.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solns/1
  # PATCH/PUT /solns/1.json
  def update
    respond_to do |format|
      if @soln.update(soln_params)
        format.html { redirect_to @soln, notice: 'Soln was successfully updated.' }
        format.json { render :show, status: :ok, location: @soln }
      else
        format.html { render :edit }
        format.json { render json: @soln.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solns/1
  # DELETE /solns/1.json
  def destroy
    @soln.destroy
    respond_to do |format|
      format.html { redirect_to solns_url, notice: 'Soln was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def upvote
    @soln = Soln.find(params[:id])
    @soln.upvote_by current_user
    redirect_to soln_path
  end

  def downvote
    @soln = Soln.find(params[:id])
    @soln.downvote_by current_user
    redirect_to solns_path
  end

  

  def diff(content1, content2)
   changes = Diffy::Diff.new(content1, content2, 
                             include_plus_and_minus_in_html: true, 
                             include_diff_info: true)
   changes.to_s.present? ? changes.to_s(:html).html_safe : 'No Changes'
  end
  def rollback
    # change the current document to the specified version
    # reify gives you the object of this version
    soln = @version.reify
    soln.save
    redirect_to edit_soln_path(document)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_soln
      @soln = Soln.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def soln_params
      params.require(:soln).permit(:solnname, :solntext, :solnauthor, :solnid, :solndate, :prob_id, :solnvotes, :solnrating)
    end

    def set_document_and_version
      @soln = Soln.find(params[:soln_id])
      @version = @soln.versions.find(params[:id])
    end
end




 
  private

    