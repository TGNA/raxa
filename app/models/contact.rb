class Contact < ActiveRecord::Base
  validates_presence_of :name, :email, :mobile, :subject

  after_commit { ContactNotification.send_contact_email(self).deliver }
end
