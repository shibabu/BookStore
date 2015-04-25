class CategoriesController < ApplicationController
  def new
    @page_title='New Category'
    @category=Category.new
  end

  def create
    @category=Category.new category_params
    if @category.save
      flash[:notice]='Category successfully created..'

      redirect_to categories_path
    else
      flash[:alert]="Couldn't create the category.."
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
    @categories=Category.all
  end

  def show
    @categories=Category.all
    @category=Category.find(params[:id])
    @books=@category.books
  end


  private
    def category_params
      params.require(:category).permit :name
    end
end
