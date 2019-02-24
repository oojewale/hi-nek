# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  protected

  def after_sign_up_path_for(resource)
    resource.citizen.present? ? citizen_path(resource.citizen) : super
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [citizen_attributes: citizen_attrs])
  end

  def citizen_attrs
    [
      :first_name, :last_name, :dob, :gender,
      :origin_state, :origin_city, :origin_street, :residence_state,
      :residence_city, :residence_street, :contesting, :image, :signature,
      :card_ready
    ]
  end
end
