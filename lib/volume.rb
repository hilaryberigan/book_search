module Books
  class Volume
  	attr_reader :publisher, :authors, :title, :subtitle, :id,
                :small_thumbnail, :thumbnail, :small, :medium,
                :large, :preview_link, :info_link

    def initialize(item)
      push_to_attributes(item)
    end

    def push_to_attributes(item)
      @id = item["id"]
      volume = item["volumeInfo"]
      
      @authors = volume["authors"].join(', ')
      @title = volume["title"]
      @subtitle = volume["subtitle"]
      @publisher = volume["publisher"]
      @preview_link = volume["previewLink"]
      @info_link = volume["infoLink"] 
      
      imageLinks = volume["imageLinks"]
      @small_thumbnail = imageLinks["smallThumbnail"]
      @thumbnail = imageLinks["thumbnail"]
      @small = imageLinks["small"]
      @medium = imageLinks["medium"]
      @large = imageLinks["large"]
      
    end
  end

end