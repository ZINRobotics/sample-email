class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def send_email(from_email, server, username, password, to_email, template)
    delivery_options = { from: from_email, user_name: username,
                         password: password,
                         address: server}
    Rails.logger.info "==========sending welcome email to ==> #{to_email}"
    mail(:to => to_email)
  end
end
