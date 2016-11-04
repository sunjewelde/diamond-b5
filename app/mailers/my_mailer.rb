class MyMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.my_mailer.upload_confirmation.subject
  #
  
  default from: "shibadiamond@gmail.com",  # 共通のヘッダ情報はここに記述
          charset: 'UTF-8'
          
          
  def upload_confirmation
    @greeting = "Hi"

    mail to: "shibadiamond@gmail.com", subject: "Diamond Chart data creation info"
  end
end
