class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
    # unless @user
    #   redirect_to root_path, alert: "Usuario no encontrado"
    #   return
    # end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Aquí puedes manejar un registro exitoso, como iniciar sesión y redirigir al perfil del usuario.
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
