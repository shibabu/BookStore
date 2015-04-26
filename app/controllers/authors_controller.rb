class AuthorsController < ApplicationController
  def new
    @page_title='New Author'
    @author=Author.new
  end

  def create
    @author=Author.new author_params
    if @author.save
      flash[:notice]='Author successfully created..'

      redirect_to authors_path
    else
      flash[:alert]="Couldn't create the author.."
      render :new
    end
  end

  def edit
    @page_title = 'Edit Author'
    @author=Author.find params[:id]
  end

  def update
    @author=Author.find params[:id]

    if @author.update author_params
      flash[:notice]='Author successfully updated ..'

      redirect_to author_path(@author)
    else
      flash[:alert]="Couldn't update the author.."

      render :edit
    end
  end

  def destroy
    @author=Author.find params[:id]

    if @author.delete
      flash[:notice]='Author successfully deleted..'

      redirect_to authors_path
    else
      flash[:alert]="Couldn't delete the author.."

      redirect_to author_path(@author)
    end
  end

  def index
    @page_title='Authors'
    @authors=Author.all
  end

  def show
    @authors=Author.all
    @author=Author.find(params[:id])
    @books=@author.books

    @page_title = @author.name
  end


  private
  def author_params
    params.require(:author).permit :first_name, :last_name
  end
end
