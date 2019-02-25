class CandidatesController < InheritedResources::Base
  before_action :set_citizen

  def create
    @candidate = Candidate.new(candidate_params)
    @candidate.citizen = @citizen

    if @candidate.save
      redirect_to citizen_candidate_path(@citizen, @candidate)
    else
      render :new
    end
  end

  private

  def candidate_params
    params.require(:candidate).permit(:party_id, :office_id)
  end

  def set_citizen
    @citizen = Citizen.find(params[:citizen_id])
  end
end

