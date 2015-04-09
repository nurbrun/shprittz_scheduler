ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :user_name            => "shprittzmailer@gmail.com",
  :password             => ENV["EMAIL"],
  :authentication       => ENV["PASSWORD"],
  :enable_starttls_auto => true
}