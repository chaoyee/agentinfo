class Agent < ActiveRecord::Base
  has_many :contacts, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    self.first_name + ' ' + self.last_name
  end  
    
  def default_contact
    if contact = self.contacts.where(default: true).take 
      contact.contact_detail
    else
      return 'N/A'
    end  
  end
end
