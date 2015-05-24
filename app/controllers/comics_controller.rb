class ComicsController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update, :destroy, :index, :new, :upvote, :downvote]
  before_action :set_comic, only: [:upvote, :downvote, :show, :edit, :update, :destroy]

  # GET /comics
  # GET /comics.json
  def index
    @comics = current_user.comics.all
  end

  # GET /comics/1
  # GET /comics/1.json
  def show
  end

  def upvote
    @comic.upvote_by current_user
    redirect_to @comic
  end

  def downvote
    @comic.downvote_by current_user
    redirect_to @comic
  end



  # GET /comics/new
  def new
    @comic = Comic.new
  end

  # GET /comics/1/edit
  def edit
  end

  # POST /comics
  # POST /comics.json
  def create
    @comic = current_user.comics.new(comic_params)

    respond_to do |format|
      if @comic.save
        @comic.upvote_by current_user
        format.html { redirect_to comics_url, notice: 'Comic was successfully created.' }
        format.json { render :show, status: :created, location: @comic }
      else
        format.html { render :new }
        format.json { render json: @comic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comics/1
  # PATCH/PUT /comics/1.json
  def update
    respond_to do |format|
      if @comic.update(comic_params)
        format.html { redirect_to comics_url, notice: 'Comic was successfully updated.' }
        format.json { render :show, status: :ok, location: @comic }
      else
        format.html { render :edit }
        format.json { render json: @comic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comics/1
  # DELETE /comics/1.json
  def destroy
    @comic.destroy
    respond_to do |format|
      format.html { redirect_to comics_url, notice: 'Comic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comic
      @comic = Comic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comic_params
      params.require(:comic).permit(:title, :description, :user_id, :image)
    end
end
