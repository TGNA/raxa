class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  validates_presence_of(:email, :password, :codigo_cliente, :nif, :cliento_con_recargo, :tarifa, :cd_ruta, :email_vendedor)
end
