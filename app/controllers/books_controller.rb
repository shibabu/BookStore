class BooksController < ApplicationController
  def new
    @page_title = 'New Book'
    @book = Book.new
    @category = Category.new
    @author = Author.new
    @publisher = Publisher.new
  end

  def create
    @book=Book.new book_params
    if @book.save
      flash[:notice]='Book successfully created..'

      redirect_to books_path
    else
      flash[:alert]="Couldn't create the book.."
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
    @books=Book.all
    @categories=Category.all
  end

  def show
    @book=Book.find params[:id]
    @categories=Category.all
  end


  private
    def book_params
      params.require(:book).permit :title, :category_id, :author_id, :publisher_id, :isbn, :price, :buy, :format, :excerpt, :pages, :year, :cover
    end
end
