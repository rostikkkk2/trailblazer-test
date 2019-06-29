class BlogsController < ApplicationController
  def index
    @result = Blog.all
  end

  def create
    result = Blog::Create.call(params.permit!)
    if result.success?
      flash[:success] = 'Good'
      return redirect_to blogs_path
    end
    @errors = result['contract.default'].errors.messages
    @result = Blog.all
    render :index
  end
end
