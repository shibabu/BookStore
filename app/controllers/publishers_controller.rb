class PublishersController < ApplicationController
  def new
    @page_title='New Publisher'
    @publisher=Publisher.new
  end

  def create
    @publisher=Publisher.new publisher_params
    if @publisher.save
      flash[:notice]='Publisher successfully created..'

      redirect_to publishers_path
    else
      flash[:alert]="Couldn't create the publisher.."
      render :new
    end
  end


  def edit
    @page_title = 'Edit Publisher'
    @publisher=Publisher.find params[:id]
  end

  def update
    @publisher=Publisher.find params[:id]

    if @publisher.update publisher_params
      flash[:notice]='Publisher successfully updated ..'

      redirect_to publisher_path(@publisher)
    else
      flash[:alert]="Couldn't update the publisher.."

      render :edit
    end
  end

  def destroy
    @publisher=Publisher.find params[:id]

    if @publisher.delete
      flash[:notice]='Publisher successfully deleted..'

      redirect_to publishers_path
    else
      flash[:alert]="Couldn't delete the publisher.."

      redirect_to publisher_path(@publisher)
    end
  end

  def index
    @page_title = 'Publishers'
    @publishers=Publisher.all
  end

  def show
    @publishers=Publisher.all
    @publisher=Publisher.find(params[:id])
    @books=@publisher.books

    @page_title = @publisher.name
  end


  private
  def publisher_params
    params.require(:publisher).permit :name
  end
end
