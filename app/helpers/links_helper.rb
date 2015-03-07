module LinksHelper

  def fetch(url)
    begin
      LinkThumbnailer.generate(url)

    rescue LinkThumbnailer::Exceptions
      #SocketError will be caught and nil will be returned
      return nil

    end

  end

end
