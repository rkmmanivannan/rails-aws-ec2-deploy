class UrlviewController < ApplicationController
  def show
    url = Urlshort.find_by(shorturl: params[:id])
    if url.present?
      urlview = Urlview.find_by(urlshort_id: url.id)
      if urlview.present?
        urlview[:count]+=1
        urlview.save
      else
        Urlview.create(urlshort_id: url.id,count: 1)
      end
       respond_to do |format|
         format.json {render json: url }
       end
    end
  end


end
