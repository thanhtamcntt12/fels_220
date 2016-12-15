class Admin::CategoriesController < ApplicationController
  before_action :logged_in_user
  def index
    @categories = Category.paginate(page: params[:page])
      .order_date_desc.per_page(Settings.per_page.category)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "create_category_success"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = t "please_login"
      redirect_to login_url
    end
  end
end
