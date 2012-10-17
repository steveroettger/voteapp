class TestDriverMailer < ActionMailer::Base
  default from: "carmanfiatexperience@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.test_driver_mailer.new_test_driver.subject
  #
  def new_test_driver(test_driver)
    @test_driver = test_driver    
    mail to: "steve@steveroettger.com", cc: "steve.roettger@gmail.com", subject: "New Carman Fiat Experience Test Driver"
  end
end
