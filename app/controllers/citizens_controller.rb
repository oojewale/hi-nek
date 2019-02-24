class CitizensController < InheritedResources::Base

  private

    def citizen_params
      params.require(:citizen).permit(:first_name, :last_name, :age, :dob, :gender, :origin_state, :origin_city, :origin_street, :residence_state, :residence_city, :residence_street, :contesting, :image, :signature, :card_ready)
    end
end

