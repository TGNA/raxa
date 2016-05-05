class NewClient < ActiveRecord::Base
  validates_presence_of :name, :email, :mobile, :subject, :dni, :company

  after_commit { ClientMailer.send_client_email(self).deliver_now }
end
