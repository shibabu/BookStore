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
    @page_title = 'Edit Book'
    @book=Book.find params[:id]
  end

  def update
    @book=Book.find params[:id]

    if @book.update book_params
      flash[:notice]='Book successfully updated ..'

      redirect_to book_path(@book)
    else
      flash[:alert]="Couldn't update the book.."

      render :edit
    end
  end

  def destroy
    @book=Book.find params[:id]

    if @book.delete
      flash[:notice]='Book successfully deleted..'

      redirect_to books_path
    else
      flash[:alert]="Couldn't delete the book.."

      redirect_to book_path(@book)
    end
  end

  def index
    @page_title = 'Books'
    @books=Book.all
    @categories=Category.all
  end

  def show
    @book=Book.find params[:id]
    @categories=Category.all

    @page_title = @book.title
  end


  private
    def book_params
      params.require(:book).permit :title, :category_id, :author_id, :publisher_id, :isbn, :price, :buy, :format, :excerpt, :pages, :year, :cover
    end
end
