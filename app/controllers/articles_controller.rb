class ArticlesController < ApplicationController
	before_action :set_article, except: [:index, :new, :create]


	def index
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			flash[:success] = "Article has been created"
			redirect_to articles_path
		else
			flash[:danger] = "Error! Could not saved"
			render :new
		end
	end

	def show
		
	end

	private

	def article_params
		params.require(:article).permit(:title, :body)
	end

	def set_article
		@article = Article.find(params[:id])
	end
end