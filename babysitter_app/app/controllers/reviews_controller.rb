class ReviewsController < ApplicationController
  before_action :set_babysitter
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = @babysitter.reviews.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = @babysitter.reviews.build
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = @babysitter.reviews.build(review_params)
    # respond_to do |format|
      if @review.save
        redirect_to babysitter_review_path(@babysitter, @review)
        # format.html { redirect_to @review, notice: 'Review was successfully created.' }
        # format.json { render :show, status: :created, location: @review }
      else
        render 'new'
        # format.html { render :new }
        # format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    # end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = @babysitter.reviews.find(params[:id])
    end

    def set_babysitter
      @babysitter = Babysitter.find(params[:babysitter_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:body, :rating, :babysitter_id)
    end
end
