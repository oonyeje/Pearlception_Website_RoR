#Script to migrate things to the bmv server from a csv file

require 'mysql2'
require 'csv'


class Run
    
    attr_accessor :id, :run_date, :location, :harvest_time, :supplier, :distributor, :other, :machine_id

    def initialize(id, run_date, location, harvest_time, supplier, distributor, other, machine_id)
        @id = id
        @run_date = run_date
        @location = location
        @harvest_time = harvest_time
        @supplier = supplier
        @distributor = distributor
        @other = other
        @machine_id = machine_id
    end

end

client = Mysql2::Client.new(
    #INSERT LOGIN INFO HERE
    )
runs = []
CSV.foreach("#{ARGV[0]}") do |row|
    runs.push(Run.new(*row)) unless row[0] == "run_id"
end
runs.each do |run|
    puts run.inspect
    query = "INSERT INTO runs (id, runDate, location, harvest_time, supplier, distributor, 
                          other, machine_id, created_at, updated_at) 
                          VALUES
                          (#{run.id},NOW(), \"UMD\" ,\"#{run.location}\",\"#{run.supplier}\",
                          \"#{run.distributor}\",\"\",1,NOW(),NOW());"
    res = client.query(query)
    puts res
end
