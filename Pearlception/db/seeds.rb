# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'securerandom'

#create admin company for login access
Company.create(company_name: 'IVA', company_token: 'a41b23cf-1d61-4fb4-9b69-0167abd7c583')

if Rails.env == 'development'
    Company.create(company_name: "Taylors", company_token: SecureRandom.uuid)
    Company.create(company_name: "Hooper's Island", company_token: SecureRandom.uuid)
end
