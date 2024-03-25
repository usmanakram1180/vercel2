class HomesController < ApplicationController
  before_action :set_home, only: %i[ show edit update destroy ]

  # GET /homes or /homes.json
  def index
    @homes = Home.all.order(created_at: :desc)
    @user = current_user
    
  end

  # GET /homes/1 or /homes/1.json
  def show
    @home = Home.find(params[:id])
    @homes = Home.all # Or whatever logic to fetch homes
     @user = current_user
     if @home.user == current_user
      @user = current_user
    else
      redirect_to root_path, notice: 'Post not found'
    end
  end

  # GET /homes/new
  def new
    @home = Home.new
    @home = current_user.homes.build
  end

   # GET /homes/1/edit
   def edit
    redirect_to root_path, notice: 'Access denied' unless @home.user == current_user
  end

  # POST /homes or /homes.json
  def create
    @home = Home.new(home_params)
    @home = current_user.homes.build(home_params)
    respond_to do |format|
      if @home.save
        format.html { redirect_to root_path, notice: "Home was successfully created." }
        format.json { render :show, status: :created, location: @home }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homes/1 or /homes/1.json
  def update
    respond_to do |format|
      if @home.user == current_user && @home.update(home_params)
        format.html { redirect_to root_path(@home), notice: "Home was successfully updated." }
        format.json { render :show, status: :ok, location: @home }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /homes/1 or /homes/1.json
  def destroy
    if @home.user == current_user
      @home.destroy!
      respond_to do |format|
        format.html { redirect_to homes_url, notice: "Home was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      redirect_to root_path, notice: 'Access denied'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home
      @home = Home.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def home_params
      params.require(:home).permit(:content, :music, :video, :photo, image: [], images: [])
    end
end
