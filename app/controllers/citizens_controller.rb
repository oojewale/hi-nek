class CitizensController < InheritedResources::Base
  def new
    redirect_home
  end

  def download_vcard
    @citizen = Citizen.find(params[:id])
    render pdf: "#{ controller_name }-#{ @citizen.id }"
  end

  private

  def citizen_params
    params.require(:citizen).permit(
      :first_name, :last_name, :dob, :gender,
      :origin_state, :origin_city, :origin_street, :residence_state,
      :residence_city, :residence_street, :contesting, :image, :signature,
      user_attributes: [:email, :password, :password_confirmation]
    )
  end
end
