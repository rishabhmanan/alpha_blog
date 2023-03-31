class ArticlesController < ApplicationController
   before_action :set_article, only: [:edit, :update, :show, :destroy]
   before_action :require_user, except:[:index, :show]
   before_action :require_same_user, only: [:edit, :update, :destroy]
   before_action :authenticate_user!

   def index
      @articles = Article.paginate(page: params[:page], per_page: 5)
   end

   def new
    @article = Article.new
   end

   def edit
      @article = Article.find(params[:id])
      respond_to do |format|
         format.html
         format.js
      end
   end

   def create
      @article = Article.new(article_params)
      @article.user = current_user
      if @article.save
         PostMailer.post_created.deliver_later
         flash[:notice] = "Article was succesfully created"
         respond_to do |format|
            # format.html {redirect_to article_path(@article)}
            format.js
         end
      else
         render 'new'
      end
   end
   
   def update
      # respond_to do |format|
      if @article.update (article_params)
        respond_to do |format|
          #format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
          format.js
        end
      else
        respond_to do |format|
          #format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end

   def show
      @article = Article.find(params[:id])
   end

   def destroy
      @article = Article.find(params[:id])
      @article.destroy
      flash[:notice] = "Article was successfully deleted"
      redirect_to articles_path
   end


   private
      def set_article
         @article = Article.find(params[:id])

      end

      def article_params
         params.require(:article).permit(:title, :description)
      end

      def require_same_user
         if current_user.id != @article.user.id
           flash[:danger]= "You can only edit or delete your own articles"
           redirect_to root_path
         end
       end

      
      
end