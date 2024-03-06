class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])

  end
  def new
    @author = Author.new
    @author.books.build
  end

  def create
    @author = Author.create(author_params)
    # debugger
    if @author.save
      redirect_to  @author , notice: "Create Successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
    redirect_to @author, notice: "Update successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

    def destroy
      @author = Author.find(params[:id])
      @author.destroy
      redirect_to root_path
    end

    private
    def author_params
      params.require(:author).permit(:name, books_attributes:[:id,:title,:_destroy])
    end

end
