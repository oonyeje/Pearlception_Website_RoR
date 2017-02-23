class User < ApplicationRecord
  belongs_to :company
  has_many :runs
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def after_database_authentication
    if !self.admin
      Apartment::Tenant.switch!(Company.find(self.company_id).company_name.gsub(/'/,'').gsub(/\s/,''))
    else
      Apartment::Tenant.switch!
    end
  end
end
