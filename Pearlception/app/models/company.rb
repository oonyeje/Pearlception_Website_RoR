class Company < ApplicationRecord
  has_many :users
  has_many :runs

  after_create :create_tenant

  private

    def create_tenant
      binding.pry
      if company_name != "IVA"
        Apartment::Tenant.create(company_name.gsub(/'/,'').gsub(/\s/,''))
        Apartment::Tenant.switch!
      end
    end
end
