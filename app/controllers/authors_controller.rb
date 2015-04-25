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
  end

  def update
  end

  def destroy
  end

  def index
  end

  def show
  end


  private
  def author_params
    params.require(:author).permit :first_name, :last_name
  end
end
