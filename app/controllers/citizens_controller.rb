class CitizensController < InheritedResources::Base
  def new
    redirect_to citizen_path(current_user.citizen) and return
  end

  private

  def citizen_params
    params.require(:citizen).permit(
      :first_name, :last_name, :dob, :gender,
      :origin_state, :origin_city, :origin_street, :residence_state,
      :residence_city, :residence_street, :contesting, :image, :signature,
      :card_ready, user_attributes: [:email, :password, :password_confirmation]
    )
  end
end
