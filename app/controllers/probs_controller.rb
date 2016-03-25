class ProbsController < ApplicationController
  before_action :set_prob, only: [:show, :edit, :update, :destroy]

  # GET /probs
  # GET /probs.json
  def index
    @probs = Prob.all
  end

  # GET /probs/1
  # GET /probs/1.json
  def show
  end

  # GET /probs/new
  def new
    @prob = Prob.new
  end



  def feed
    @probs = Prob.all
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end


  # GET /probs/1/edit
  def edit
  end

  # POST /probs
  # POST /probs.json
  def create
    @prob = Prob.new(prob_params)

    respond_to do |format|
      if @prob.save
        format.html { redirect_to @prob, notice: 'Prob was successfully created.' }
        format.json { render :show, status: :created, location: @prob }
      else
        format.html { render :new }
        format.json { render json: @prob.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /probs/1
  # PATCH/PUT /probs/1.json
  def update
    respond_to do |format|
      if @prob.update(prob_params)
        format.html { redirect_to @prob, notice: 'Prob was successfully updated.' }
        format.json { render :show, status: :ok, location: @prob }
      else
        format.html { render :edit }
        format.json { render json: @prob.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /probs/1
  # DELETE /probs/1.json
  def destroy
    @prob.destroy
    respond_to do |format|
      format.html { redirect_to probs_url, notice: 'Prob was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @prob = Prob.find(params[:id])
    @prob.upvote_by current_user
    redirect_to probs_path
  end

  def downvote
    @prob = Prob.find(params[:id])
    @prob.downvote_by current_user
    redirect_to probs_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prob
      @prob = Prob.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prob_params
      params.require(:prob).permit(:pname, :pstatement, :pid, :pdate, :person, :votes, :rateing, :points, :tag, :probstatus, :emp, :sym)
    end
end
