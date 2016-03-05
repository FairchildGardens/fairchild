class HuntsController < ApplicationController
  before_action :set_hunt, only: [:show, :edit, :update, :destroy]

  def index
    @hunts = Hunt.all
  end

  def show
  end

  def new
    @hunt = Hunt.new
  end

  def edit
  end

  def create
    @hunt = Hunt.new(hunt_params)

    respond_to do |format|
      if @hunt.save
        format.html { redirect_to @hunt, notice: 'Hunt was successfully created.' }
        format.json { render :show, status: :created, location: @hunt }
      else
        format.html { render :new }
        format.json { render json: @hunt.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @hunt.update(hunt_params)
        format.html { redirect_to @hunt, notice: 'Hunt was successfully updated.' }
        format.json { render :show, status: :ok, location: @hunt }
      else
        format.html { render :edit }
        format.json { render json: @hunt.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hunt.destroy
    respond_to do |format|
      format.html { redirect_to hunts_url, notice: 'Hunt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_hunt
      @hunt = Hunt.find(params[:id])
    end

    def hunt_params
      params.require(:hunt).permit(:name, :image, :description)
    end
end
