class VersionsController < ApplicationController
  before_action :set_soln_and_version, only: [:diff, :rollback, :destroy]
  
  def diff
  end

  def rollback
    document = @version.reify
    document.save
    redirect_to edit_soln_path(document)
  end

  def destroy
  end

  private

    def set_soln_and_version
      @soln = Soln.find(params[:soln_id])
      @version = @soln.versions.find(params[:id])
    end
end
