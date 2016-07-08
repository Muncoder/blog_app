class ArticlesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_article, except: [:index, :new, :create]

	def index
		@articles = Article.all.order("created_at DESC")
	end

	def new
		@article = Article.new
	end

	def create
		@article.user_id = current_user
		@article = Article.new(article_params)

		if @article.save
			flash[:success] = "Article has been created"
			redirect_to articles_path
		else
			flash.now[:danger] = "Article has not been created"
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		@article.user_id = current_user
		if @article.update(article_params)
			flash[:success] = "Article has been updated successfully"
			redirect_to @article
		else
			flash.now[:danger] = "Article has not been updated"
			render :edit
		end
	end

	def destroy
		@article.destroy
		flash[:success] = "Deleted successfully!"
		redirect_to root_path
	end


	private

	def article_params
		params.require(:article).permit(:title, :body, :user_id)
	end

	def set_article
		@article = Article.find(params[:id])
	end
end