class ContactMailer < ApplicationMailer
  default to: "delarosa1254@gmail.com" # <-- where you want to receive messages

  def contact_email(name:, email:, message:)
    @name    = name
    @email   = email
    @message = message

    mail(
      subject: "New contact from #{@name}",
      from: (email.presence || "no-reply@portfolio.local")
    )
  end
end
