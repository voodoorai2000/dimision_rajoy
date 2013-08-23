class Verification < ActiveRecord::Base
  validates :phone, presence: {:message => 'Por favor introduzca su número de móvil.'}
  validate :country_code

  def country_code
    unless phone.match(*/\A[+]34/)
      errors.add(:base, "Por favor no olvide poner el prefijo de España +34. Si su número no es español sentimos decirle que no puede votar.")
    end
  end

  validates :phone, :format => { :with => /\A[+]\d{11}\z/, :message => 'Parece que no es un número válido, por favor revíselo.'}
end
