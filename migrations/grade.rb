
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
