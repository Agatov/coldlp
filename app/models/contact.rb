class Contact < ActiveRecord::Base
  before_create :generate_unique_code

  has_many :orders
  has_many :comments

  enum status: [:fresh, :rejected, :in_progress, :recall, :success]


  def generate_unique_code
    non_unique = true

    while non_unique
      self.code = rand(1001..9999)
      a = Contact.find_by_code self.code
      non_unique = false unless a
    end

  end
end
