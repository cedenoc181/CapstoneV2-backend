class ArticlesController < ApplicationController
  # skip before action :authorized allows me to index and show articles without a user logged in 
  skip_before_action :authorized, only: %i[show index]
  # before action sets the private method set_article for the 3 listed methods so no need to add it in the method code
  before_action :set_article, only: %i[show, update, destroy]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
    render json: @articles, status: :ok
  end

  # GET /articles/1 or /articles/1.json
  def show
    render json: @article, status: :ok
  end

  # POST /articles or /articles.json
  def create
    @article = Article.create!(create_article_params)
    render json: @article, status: :created
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
      @article.update(update_article_params)
      render json: @article
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
      @article.destroy
      head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def create_article_params
      params.require(:article).permit(:physical_therapist_id, :title, :author, :article_body, :category, :published, :photo)
    end

    def update_article_params
      params.require(:article).permit(:title, :author, :article_body, :category, :published, :photo)
    end

end
