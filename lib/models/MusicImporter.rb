class MusicImporter
  attr_accessor :path
  
  def initialize(path) 
    @path = path
  end
  
  def files 
    Dir[@path+"/*.mp3"].map{|f| File.basename(f)}
  end

end