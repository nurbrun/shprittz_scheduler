ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :user_name            => "shprittzmailer@gmail.com",
  :password             => "asdqwe123qweasd",
  :authentication       => "plain",
  :enable_starttls_auto => true
}