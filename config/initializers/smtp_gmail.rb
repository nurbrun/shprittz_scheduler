if Rails.env.production?

	# ActionMailer::Base.delivery_method = :sendmail
	ActionMailer::Base.delivery_method = :smtp

	ActionMailer::Base.perform_deliveries = true
	ActionMailer::Base.raise_delivery_errors = true

	ActionMailer::Base.smtp_settings = {
	  :address              => "smtp.gmail.com",
	  :port                 => 587,
	  :domain               => "gmail.com",
	  :user_name            => ENV['EMAIL'],
	  :password             => ENV['PASSWORD'],
	  :authentication       => "plain",
	  :enable_starttls_auto => true
	}

	ActionMailer::Base.default_url_options[:host] = "afternoon-brook-2239.herokuapp.com"

end