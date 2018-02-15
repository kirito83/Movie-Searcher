class MovieStandardized
    attr_accessor :id, :title, :release_date, :director, :image_url

    def initialize(movie_object)
        @id = movie_object.id
        @title = movie_object.title
        @release_date = movie_object.release_date
        @director = find_directors
        @image_url = find_poster
    end

    def find_directors
        credits = Tmdb::Movie.credits(@id)
        directors_array = credits["crew"].select{|cast| cast["job"]=="Director"}
        director = ""
        directors_array.each do |d|
            director += "#{d["name"]}, "
        end
        director = director[0..-3]
        @director = director
    end

    def find_poster
        posters = Tmdb::Movie.images(@id)
        #Retreive base url and poster size
        base_url = "http://image.tmdb.org/t/p/"
        poster_size = "w92"
        if !(posters.nil? || posters["posters"].nil? || posters["posters"][0].nil?)
            file_path = base_url + poster_size + posters["posters"][0]["file_path"]
        else
            file_path="#"
        end
    end

end