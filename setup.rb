#Link every result to run id 48
require 'mysql2'
require 'fileutils'

$company_data_endpoint = "companydata.c02zesysnssi.us-west-2.rds.amazonaws.com"

def establish_db_connection
	client = Mysql2::Client.new(host:$company_data_endpoint, username:"ivauser", password:"ivapassword", database: "Hooper's Island")
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

def migrate_oysters
	client = establish_db_connection
	client.query("SELECT *  FROM oysters").each do |res|
		puts res
	end
end

########## MAIN METHOD #####################
bundle #bundle install
initial_migration #Setup db
migrate_oysters
#add in og admin
#Migrate all the oysters,runs,results from the AWS DB
