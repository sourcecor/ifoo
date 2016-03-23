class Search
  def advance_search
    products = Admin::Product.all

    return products
  end

  def search
    products = Admin::Product.all

    products = products.where(["caption LIKE ?", "%@{keywords}%"]) if keywords.present?
    products = products.categories.where(["caption LIKE ?", "%@{keywords}%"]) if keywords.present?

    return products
  end
end
