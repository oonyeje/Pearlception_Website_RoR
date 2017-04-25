require 'mysql2'
require 'active_record'

ActiveRecord::Base.establish_connection(
    adapter: 'mysql2',
    host: 'localhost',
    database: 'development_HoopersIsland',
    username: 'bmv',
    password: '1156244terps!'
)

class Grade < ActiveRecord::Base
    
end

class Oyster < ActiveRecord::Base

end

class Run < ActiveRecord::Base

end

runs = Run.all
grades = Grade.all.to_a
runs.each do |run|
    20.times do
        len = rand(0..10)
        width = rand(0..10)
        height = rand(0..10)
        vol = len * width * height
        oyster = Oyster.new(run_id: run.id, grade: grades[rand(0...grades.length)].Full_name,volume:vol, length:len, width:width, height:height)
        oyster.save
    end
end
