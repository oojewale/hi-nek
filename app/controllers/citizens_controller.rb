class CitizensController < InheritedResources::Base
  def new
    redirect_to_citizen and return
  end

  def download_vcard
    @citizen = Citizen.find(params[:id])
    render pdf: "#{ controller_name }-#{ @citizen.id }"
  end

  private

  def redirect_to_citizen
    redirect_to citizen_path(current_user.citizen)
  end

  def citizen_params
    params.require(:citizen).permit(
      :first_name, :last_name, :dob, :gender,
      :origin_state, :origin_city, :origin_street, :residence_state,
      :residence_city, :residence_street, :contesting, :image, :signature,
      :card_ready, user_attributes: [:email, :password, :password_confirmation]
    )
  end
end
