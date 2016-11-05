class MyMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.my_mailer.upload_confirmation.subject
  #
  
  default from: "shibadiamond@gmail.com",  # 共通のヘッダ情報はここに記述
          charset: 'UTF-8'
  
  def upload_confirmation_csv
    # @greeting = "Hi"
    @greeting_confirmation_csv = Diamond.maximum(:date)

    mail to: "sushi.honda@gmail.com", cc: "shibadiamond@gmail.com", subject: "Diamond Chart data creation info"
  end
          
          
  def upload_confirmation
    # @greeting = "Hi"
    @greeting_confirmation = Table.maximum(:date)

    mail to: "sushi.honda@gmail.com", cc: "shibadiamond@gmail.com", subject: "Diamond Chart data creation info"
  end
  
  def upload_confirmation_table
    # @greeting = "Hi"
    @greeting_confirmation_table = List.maximum(:date)
    
    mail to: "sushi.honda@gmail.com", cc: "shibadiamond@gmail.com", subject: "Diamond Chart data creation info"
  end
  
  def upload_confirmation_index
    # @greeting = "Hi"
    @greeting_confirmation_index = Index.maximum(:date)
    
    mail to: "sushi.honda@gmail.com", cc: "shibadiamond@gmail.com", subject: "Diamond Chart data creation info"
  end
    
end
