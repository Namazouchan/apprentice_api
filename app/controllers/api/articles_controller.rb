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
  
      private
  
      def article_params
        params.require(:article).permit(:title, :description, :body, tagList: [])
      end
    end
  end
  
