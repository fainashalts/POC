module LinksHelper

  def fetch(url)
    LinkThumbnailer.generate(url)   
  end

end
