# Load the rails application
require File.expand_path('../application', __FILE__)

#OAuth configuration
OAUTH_CONFIG = YAML.load_file("#{::Rails.root}/config/oauth.yml")

ENV_NAME = "dev"

# Initialize the rails application
StartupSignal::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name      => 'tigerlily',
  :password       => 'TODO',
  :domain         => 'tigerli.ly',
  :address        => "smtp.sendgrid.net",
  :port           => "587",
  :authentication => :plain,
  :enable_starttls_auto => true
}

