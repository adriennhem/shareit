ActionMailer::Base.smtp_settings = {
	address: "smtp.mandrillapp.com",
	port: 587,
	enables_starttls_auto: true,
	user_name: ENV["MANDRILL_NAME"],
	password: ENV["MANDRILL_PASSWORD"],
	authentification: "login"

}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"