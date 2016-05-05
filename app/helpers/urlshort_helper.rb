module UrlshortHelper
  def domainname
    @domainname = request.base_url
  end
end
