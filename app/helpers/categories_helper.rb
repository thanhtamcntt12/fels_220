module CategoriesHelper
  def current_index page_index , page_size, index
    (page_index - 1)*page_size + (index + 1)
  end
end
