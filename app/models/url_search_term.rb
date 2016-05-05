class UrlSearchTerm
  attr_reader :where_clause, :where_args, :order

  def initialize(search_term)
    search_term   = search_term.downcase
    @where_clause = ""
    @where_args   = {}
    build_search(search_term)
  end

  def build_search(search_term)
    @where_clause << case_insensitive_search(:originalurl)
    @where_args[:originalurl] = starts_with(search_term)

    # @where_clause << case_insensitive_search(:originalurl)
    # @where_args[:originalurl] = starts_with(search_term)

    @where_clause << " OR #{case_insensitive_search(:shorturl)}"
    @where_args[:shorturl] = starts_with(search_term)



    @order = "shorturl = '#{search_term}' desc, shorturl asc"
  end

  def starts_with(search_term)
    "%" + search_term + "%"
  end

  def case_insensitive_search(field_name)
    "lower(#{field_name}) like :#{field_name}"
  end


end
