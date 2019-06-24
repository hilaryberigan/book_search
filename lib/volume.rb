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
      @publisher = item["publisher"]
      @preview_link = item["previewLink"]
      @info_link = item["infoLink"]

      volume = item["volumeInfo"]
      @authors = volume["authors"]
      @title = volume["title"]
      @subtitle = volume["subtitle"] 
      
      imageLinks = volume["imageLinks"]
      @small_thumbnail = imageLinks["smallThumbnail"]
      @thumbnail = imageLinks["thumbnail"]
      @small = imageLinks["small"]
      @medium = imageLinks["medium"]
      @large = imageLinks["large"]
      
    end
  end

end