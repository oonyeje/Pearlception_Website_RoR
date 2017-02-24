#Link every result to run id 48
require 'mysql2'
require 'fileutils'

$company_data_endpoint = "companydata.c02zesysnssi.us-west-2.rds.amazonaws.com"

class Run

end


#This will run the initial migration that sets up the db to be apartment friendly
def initial_migration
    apartment_copy_path = 'init/apartment.rb'
    apartment_path = 'Pearlception/config/initializers/apartment.rb'
    FileUtils.cp(apartment_path, 'init/apartment_copy' ) #Copy the original file back
    FileUtils.rm(apartment_path) #Remove the original file
    FileUtils.cp(apartment_copy_path,apartment_path) #Copy the blank copy into init
    Dir.chdir('Pearlception') do 
        puts `rake db:migrate` #Run the migration
    end
    FileUtils.rm(apartment_path) #Remove the blank copy
    FileUtils.cp('init/apartment_copy',apartment_path)
    FileUtils.rm('init/apartment_copy')
end

#Runs the initial bundle install
def bundle
    Dir.chdir("Pearlception") do
        puts `bundle install`
    end
end

def setup_initial_admin
	client = Mysql2::Client.new(host:'localhost' ,username:"colealban", password:"1156244Terps!", database: "Pearlception_development")
	client.query("INSERT INTO companies (company_name, company_token, created_at, updated_at) VALUES (\"IVA\", \"a41b23cf-1d61-4fb4-9b69-0167abd7c583\",NOW(),NOW())")
end

########## MAIN METHOD #####################
bundle #bundle install
initial_migration #Setup db
setup_initial_admin
#add in og admin
#Migrate all the oysters,runs,results from the AWS DB
