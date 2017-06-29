#Prepopulate Users
%w(Pavel Piotr Stepan Aleksandr Kosmos).each do |name|
  params = {
    name: name,
    email: "#{name.downcase}@email.com",
    password: '1password!',
    password_confirmation: '1password!'
  }

  User.create(params) if User.find_by_name(name).blank?
end
