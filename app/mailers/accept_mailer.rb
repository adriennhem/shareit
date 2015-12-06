class AcceptMailer < ActionMailer::Base
  default from: "hello@workshopr.me"
  def accept(seller, project, buyer)
    mail(to: seller.email, subject: "Project Accepted", body: "#{buyer.email} has accepted your project named #{project.title} published by #{project.company_name}")
  end 
end