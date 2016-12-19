class Admin::CategoriesController < ApplicationController
  before_action :logged_in_user
  before_action :load_category, only: :edit, :update, :destroy
  before_action :verify_admin

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

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "update_success"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t "category_delete"
    else
      flash[:danger] = t "unsuccess_delete"
    end
    redirect_to admin_categories_path
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

  def load_category
    @category = Category.find_by id: params[:id]
    unless @category
      flash[:warning] = t "id_not_exist"
      redirect_to admin_categories_path
    end
  end

  def verify_admin
    unless current_user.is_admin?
      flash[:danger] = t "access_denied"
      redirect_to root_url
    end
  end
end
