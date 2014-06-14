unless User.any?
  User.create \
    email: 'admin@example.com',
    password: 'password',
    password_confirmation: 'password'
end

unless Service.any?
  services = YAML::load_file("#{Rails.root}/db/services.yml").with_indifferent_access

  services.each do |name, from_attrs|
    logger.debug "Creating service :#{name}.."
    Service.create! from_attrs
  end
end
