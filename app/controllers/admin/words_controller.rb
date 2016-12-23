class Admin::WordsController < ApplicationController
  before_action :verify_admin, only: :destroy
  before_action :logged_in_user
  before_action :load_word, only: [:edit, :update, :destroy]
  before_action :load_categories

  def index
    @category = Category.find_by id: params[:category_id]
    if @category
      flash[:danger] = t "admin_load_fails_category"
      redirect_to new_admin_word_path
    end
    @words = Word.paginate page: params[:page],
      per_page: Settings.per_page.words
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.create word_params
    if @word.save
      flash[:success] = t "create_words_success"
      redirect_to admin_words_path
    else
      render :new
    end
  end

  private
  def word_params
    params.require(:word).permit :word_detail, :category_id
  end

  def load_categories
    @categories = Category.all
  end

  def load_word
    @word = Word.find_by id: params[:id]
    render_404 if @word.nil?
  end
end
