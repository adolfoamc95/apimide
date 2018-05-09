class RegistrationsController < RailsJwtAuth::RegistrationsController
  private

  def registration_create_params
    params.permit(:name, :email, :password)
  end

end
