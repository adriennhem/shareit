class AcceptMailer < ActionMailer::Base
  default from: "hello@workshopr.me"
  def accept(seller, project)
    mail(to: seller.email, subject: "Welcome", body: "You have accepted the project named #{project.title}")
  end 
end