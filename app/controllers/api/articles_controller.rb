module Api
    class ArticlesController < ApplicationController
      def create
        article = Article.new(article_params)
        if article.save
          render json: { article: article }, status: :created, methods: [:createdAt, :updatedAt]
        else
          render json: { errors: article.errors }, status: :unprocessable_entity
        end
      end

      def show
        article = Article.find_by(slug: params[:slug])
        if article
          render json: { article: article }, methods: [:tagList, :createdAt, :updatedAt]
        else
          render json: { error: 'Article not found' }, status: :not_found
        end
      end
 
      private
  
      def article_params
        params.require(:article).permit(:title, :description, :body, tagList: [])
      end
    end
  end
  
