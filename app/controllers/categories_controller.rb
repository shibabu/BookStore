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
    @page_title = 'Edit Category'
    @category=Category.find params[:id]
  end

  def update
    @category=Category.find params[:id]

    if @category.update category_params
      flash[:notice]='Category successfully updated ..'

      redirect_to category_path(@category)
    else
      flash[:alert]="Couldn't update the category.."

      render :edit
    end
  end

  def destroy
    @category=Category.find params[:id]

    if @category.delete
      flash[:notice]='Category successfully deleted..'

      redirect_to categories_path
    else
      flash[:alert]="Couldn't delete the category.."

      redirect_to category_path(@category)
    end
  end

  def index
    @page_title = 'Categories'
    @categories=Category.all
  end

  def show
    @categories=Category.all
    @category=Category.find(params[:id])
    @books=@category.books

    @page_title = @category.name
  end


  private
    def category_params
      params.require(:category).permit :name
    end
end
