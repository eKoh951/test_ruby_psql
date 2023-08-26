class User < ApplicationRecord
  has_secure_password

  # Validaciones
  validates :first_name, :last_name, presence: true
  validates :email, presence: { message: "El email es obligatorio" }, 
                    uniqueness: { message: "Este email ya está registrado" }, 
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "El formato del email no es válido" }
  validates :password, confirmation: { message: "Las contraseñas no coinciden" }
  validates :username, presence: { message: "El nombre de usuario es obligatorio" },
                       uniqueness: { message: "Este nombre de usuario ya está tomado "}

  # Callbacks
  before_validation :generate_username, on: :create

  # Métodos
  def generate_username
    self.username = "#{first_name}.#{last_name}".downcase
    # Si el username ya existe, añade un número al final y verifica nuevamente
    while User.where(username: self.username).exists?
      self.username = "#{self.username}#{rand(1..9)}"
    end
  end

  def to_param
    username
  end
end
