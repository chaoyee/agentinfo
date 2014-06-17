class Contact < ActiveRecord::Base
  belongs_to :agent
  validates  :contact_detail, presence: true 

  def set_default_contact      
    set_other_contact_default_to_false(self.agent_id, self.id) if self.default   
  end

  private

  def set_other_contact_default_to_false(agent_id, contact_id) 
    contacts = Contact.where(agent_id: agent_id).where.not(id: contact_id)
    contacts.each do |contact|
      contact.update_attribute(:default, false)
    end
  end
end
