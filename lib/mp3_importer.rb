
class MP3Importer

    attr_accessor :path
    def initialize(path)
        @path=path
    end

    def files
        paths=[]
        Dir.foreach(@path){
            |path|
            paths << path if (path.length>2 && path[path.length-4, path.length-1]=='.mp3')
        }
        paths
    end

    def import
        self.files.each{|filename|
            Song.new_by_filename(filename)
        }
    end
end