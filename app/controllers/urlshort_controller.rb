class UrlshortController < ApplicationController
  PAGE_SIZE = 10
  def index
    # debugger
    if params[:keywords].present?
      find_keyword
    elsif params[:destroyid].present?
      destroy
    else
      current_user_url_list
    end
  end

  def show
    urllist = Urlshort.find(params[:id])
    respond_to do |format|
      format.json { render json: urllist }
    end
  end

  def update
    urlshort = Urlshort.find(params[:id])
    urlshort.update_attributes(user_params)
    head :ok
  end


  def current_user_url_list
    @page = (params[:page] || 0).to_i
    @domainname = request.base_url
    urllist = Urlshort.select("'#{@domainname}' as domainname,shorturl,originalurl,ipaddress,id").where(user_id: current_user.id).
                        order(id: :desc).
                        offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
    respond_to do |format|
      format.json { render json: urllist }
    end
  end

  def find_keyword
    @page = (params[:page] || 0).to_i
    if params[:keywords].present?
      @keywords  = params[:keywords]
      @domainname = request.base_url
      url_search_term = UrlSearchTerm.new(@keywords)
      @urlshorts = Urlshort.select("'#{@domainname}' as domainname,shorturl,originalurl,ipaddress,id").
                      where(
                      url_search_term.where_clause,
                      url_search_term.where_args).
                      order(url_search_term.order).
                      offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
    else
      @urlshorts = []
    end

    respond_to do |format|
      format.html {}
      format.json { render json: @urlshorts }
    end
  end

  def new
    @urlshort=Urlshort.new
  end

  def create
    # debugger
    urlshort = Urlshort.new(user_params)
    urlshort[:ipaddress] = request.remote_ip
    urlshort[:user_id]   = current_user.id
    urlshort.save
    head :ok
    # respond_to do |format|
    #   format.json
    # end
  end

  def destroy
    @urlshort = Urlshort.find(params[:destroyid])
    @urlshort.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def user_params
   params.require(:urlshort).permit(:originalurl,:shorturl,:id)
  end


end
