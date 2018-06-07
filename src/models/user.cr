class User < BaseModel
  include Carbon::Emailable
  include Authentic::PasswordAuthenticatable

  table :users do
    column email : String
    column encrypted_password : String
    column admin : Bool
  end

  def admin? : Bool
    admin
  end

  def emailable
    Carbon::Address.new(email)
  end
end
