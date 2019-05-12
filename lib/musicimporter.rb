class MusicImporter
  attr_accessor :path
  def initialize(filepath)
    @path = filepath
  end


  def files
    fileslist = @path + "/*.mp3"
    newlist = []
    files = Dir.glob(fileslist)
    files.each do |item|
      stripped = item.gsub(@path + "/","")
      newlist << stripped
    end
    newlist

  end


  def import
    self.files.each do |item|
      Song.create_from_filename(item)
    end

  end
end
