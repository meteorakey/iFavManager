class TwitterAuthsController < ApplicationController
  before_action :set_twitter_auth, only: [:show, :edit, :update, :destroy]

  # GET /twitter_auths
  # GET /twitter_auths.json
  def index
    @twitter_auths = TwitterAuth.all
  end

  # GET /twitter_auths/1
  # GET /twitter_auths/1.json
  def show
  end

  # GET /twitter_auths/new
  def new
    @twitter_auth = TwitterAuth.new
  end

  # GET /twitter_auths/1/edit
  def edit
  end

  # POST /twitter_auths
  # POST /twitter_auths.json
  def create
    @twitter_auth = TwitterAuth.new(twitter_auth_params)

    respond_to do |format|
      if @twitter_auth.save
        format.html { redirect_to @twitter_auth, notice: 'Twitter auth was successfully created.' }
        format.json { render :show, status: :created, location: @twitter_auth }
      else
        format.html { render :new }
        format.json { render json: @twitter_auth.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /twitter_auths/1
  # PATCH/PUT /twitter_auths/1.json
  def update
    respond_to do |format|
      if @twitter_auth.update(twitter_auth_params)
        format.html { redirect_to @twitter_auth, notice: 'Twitter auth was successfully updated.' }
        format.json { render :show, status: :ok, location: @twitter_auth }
      else
        format.html { render :edit }
        format.json { render json: @twitter_auth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twitter_auths/1
  # DELETE /twitter_auths/1.json
  def destroy
    @twitter_auth.destroy
    respond_to do |format|
      format.html { redirect_to twitter_auths_url, notice: 'Twitter auth was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twitter_auth
      @twitter_auth = TwitterAuth.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def twitter_auth_params
      params[:twitter_auth]
    end
end
