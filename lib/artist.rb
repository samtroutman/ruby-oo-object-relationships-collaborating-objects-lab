class Artist
    attr_accessor :name

    @@all =[]

    def initialize(name)
        @name = name
        @@all << self
        @songs = []
    end

    def self.all
        @@all
    end

    def add_song(song)
        @songs << song #has many
        song.artist = self #belong to
    end

    def save 
        @@all << self
    end

    def songs
        Song.all.select { |song| song.artist == self}
    end

    def self.find_or_create_by_name(name)
     self.all.detect { |artist| artist.name == name} || Artist.new(name)
    end

    def print_songs
        @songs.each { |song| puts song.name}
    end


end
