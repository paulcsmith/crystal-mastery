class MakeAdmin < LuckyCli::Task
  banner "Make the user with passed in email an admin"

  def call
    email = ARGV.first? || raise "Must provide a user email"
    user = UserQuery.new.email(ARGV.first).first? || raise "Could not find user: #{email}"
    User::BaseForm.update!(user, admin: true)
    puts "Done. Made #{email} an admin"
  end
end
