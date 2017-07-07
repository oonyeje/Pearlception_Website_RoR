#Link every result to run id 48
require 'mysql2'
require 'fileutils'

#$company_data_endpoint = "companydata.c02zesysnssi.us-west-2.rds.amazonaws.com"

#A class to represent a run
class Run
                                
    def initialize(params)
        @run_id = params["run_id"]
        @runDate = params["runDate"].strftime('%Y-%m-%d %H:%M:%S') || nil
        @location = params["location"] || "NULL"
        @supplier = params["supplier"] || "NULL"
        @other = params["other"] || "NULL"
        @machine_id = params["machine_id"] || "NULL"
        @harvest_time = params["harvest time"] || "NULL"
        @distributor = params["distributor"] || "NULL"
    end

    def to_insert_query
        "INSERT into runs (id, runDate, location, harvest_time, supplier, distributor, other, machine_id,created_at,updated_at) VALUES 
        (#{@run_id}, '#{@runDate}',\"#{@location}\",NOW(),\"#{@supplier}\",\"#{@distributor}\",
        \"#{@other}\",#{@machine_id},NOW(),NOW());"
    end

end

#A class to represent a grade
class Grade
    
    def initialize(params)
        @id = params["grade_id"]
        @full_name = params["Full_Name"] || "NULL"
        @short_name = params["Short_Name"] || "NULL"
        @volume_max = params["Volume_max"] || 0
        @volume_min = params["Volume_min"] || 0
        @length_max = params["Length_max"] || 0
        @length_min = params["Length_min"] || 0
        @width_max = params["Width_max"] || 0
        @width_min = params["Width_min"] || 0
        @height_max = params["Height_max"] || 0
        @height_min = params["Height_min"] || 0
    end

    def to_insert_query
        "INSERT into grades (id, Full_Name, Short_Name, Volume_max, Volume_min, Length_max, Length_min, Width_max, Width_min, Height_max, Height_min,created_at,updated_at) VALUES
        (#{@id},\"#{@full_name}\",\"#{@short_name}\",#{@volume_max},#{@volume_min},#{@length_max},#{@length_min},#{@width_max},#{@width_min},#{@height_max},#{@height_min},NOW(),NOW());"
    end

end


#This will run the initial migration that sets up the db to be apartment friendly
def initial_migration
    apartment_copy_path = 'init/apartment.rb'
    apartment_path = 'Pearlception/config/initializers/apartment.rb'
    FileUtils.cp(apartment_path, 'init/apartment_copy' ) #Copy the original file back
    FileUtils.rm(apartment_path) #Remove the original file
    FileUtils.cp(apartment_copy_path,apartment_path) #Copy the blank copy into init
    Dir.chdir('Pearlception') do 
        puts `rake db:setup`
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

#This will insert the initial IVA admin needed to run the website.
def setup_initial_admin
	client = Mysql2::Client.new(host:'localhost' ,username:"bmv", password:"1156244terps!", database: "Pearlception_development")
	client.query("INSERT INTO companies (company_name, company_token, created_at, updated_at) VALUES (\"IVA\", \"a41b23cf-1d61-4fb4-9b69-0167abd7c583\",NOW(),NOW())")
end

#This will migrate over all the runs that are on the AWS database to your local db
def migrate_runs
    client = Mysql2::Client.new(host: $company_data_endpoint, username: 'ivauser', password: 'ivapassword', database: 'Hooper\'s Island')
	local_client = Mysql2::Client.new(host:'localhost' ,username:"bmv", password:"1156244terps!", database: "development_HoopersIsland")
    client.query("SELECT * FROM runs").each do |params|
        run = Run.new(params)
        puts run.to_insert_query
        local_client.query(run.to_insert_query)
    end
end


#This will migrate over all the oystersd
# def migrate_grades
#     client = Mysql2::Client.new(host: $company_data_endpoint, username: 'ivauser', password: 'ivapassword', database: 'Hooper\'s Island')
# 	local_client = Mysql2::Client.new(host:'localhost' ,username:"bmv", password:"1156244terps!", database: "development_HoopersIsland")
#     client.query("SELECT * FROM grades").each do |params|
#         grade = Grade.new(params)
#         local_client.query(grade.to_insert_query)
#     end
# end

#This will remvoe hoopers island DB
def drop_hoopers
	client = Mysql2::Client.new(host:'localhost' ,username:"bmv", password:"1156244terps!", database: "Pearlception_development")
    client.query("DROP DATABASE development_HoopersIsland;")
end


#This will setup the Hooper's Island DB
def setup_hoopers
	client = Mysql2::Client.new(host:'localhost' ,username:"bmv", password:"1156244terps!", database: "Pearlception_development")
    client.query("CREATE DATABASE development_HoopersIsland;")
    client.query("INSERT INTO companies (company_name, company_token, created_at, updated_at) VALUES (\"Hooper's Island\",\"c25f10d9-61ad-4d2e-85fe-21f770d9a391\",NOW(),NOW());")
end


########## MAIN METHOD #####################
if ARGV.include?("init") #What you should run upon a fresh clone eg: ruby setup.rb init
    #bundle
    #initial_migration
    setup_initial_admin
end

if ARGV.include? "reset" #What to run if you want to reset ALL the data in the DBs eg: ruby setup.rb reset
    Dir.chdir("Pearlception") do 
        puts `rake db:drop`
    end
    initial_migration
    drop_hoopers
    setup_initial_admin
end

if ARGV.include? "hoopers" 
    begin
        setup_hoopers
    rescue 
        puts "Hoopers already exists"
    end
    #migrate_runs
end
#migrate_grades
