class Artist
    attr_accessor :name
    @@all = []

    def self.all
        @@all
    end

    def add_song(song)
        song.artist=self
    end

    def songs
        Song.all.select{|song| song.artist==self}
    end

    def self.find_or_create_by_name(name)
        artist=self.all.find{|artist| artist.name== name}
        if(artist)
            return artist
        else
            return self.new(name)
        end
    end

    def initialize(name)
        @name=name
        @@all << self
    end

    def print_songs
        puts self.songs.map{|song| song.name}
    end
end