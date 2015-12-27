class Enrollment < ActiveRecord::Base
  belongs_to :user 
  belongs_to :lecture
  validates :user_id, presence: true
  validates :lecture_id, presence: true 
  validates :lecture, uniqueness: { scope: :user, message: "should happen once per user" }

  def receipt 
  	Receipts::Receipt.new(
      id: id,
      product: lecture.title,
      company: {
        name: "Workshopr",
        address: "12 Blair Street, E140NY",
        email: "hello@workshopr.me",
        logo: Rails.root.join("app/assets/images/social-icons_01.jpg")
      },
      line_items: [
        ["Date",           created_at.to_s],
        ["Account Billed", "#{user.email}"],
        ["Product",        "#{lecture.title}"],
      ],
    )
  end

end
