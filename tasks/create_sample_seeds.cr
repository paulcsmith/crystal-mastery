require "../spec/support/boxes/**"

# Add sample data helpful for development, e.g. (fake users, blog posts, etc.)
#
# Use `Db::CreateRequiredSeeds` if you need to create data *required* for your
# app to work.
class Db::CreateSampleSeeds < LuckyCli::Task
  banner "Add sample database records helpful for development"

  def call
    admin_email = "admin@example.com"
    unless UserQuery.new.email(admin_email).first?
      password = Authentic.generate_encrypted_password("password")
      UserForm.create!(email: admin_email, encrypted_password: password)
    end
  end
end
