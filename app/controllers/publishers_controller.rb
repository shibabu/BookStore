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
  def publisher_params
    params.require(:publisher).permit :name
  end
end
