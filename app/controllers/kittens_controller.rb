class KittensController < ApplicationController
  before_action :set_kitten, only: [:show, :edit, :update, :destroy] # sets a kitten before doing one of the 4 actions

  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html
      format.json { render json: @kittens }
      format.xml { render xml: @kittens }
    end
  end

  # GET /kittens/1
  # GET /kittens/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: @kitten }
      format.xml { render xml: @kitten }
    end
  end

  # GET /kittens/new
  def new
    @kitten = Kitten.new
  end

  # POST /kittens
  # POST /kittens.json
  def create
    @kitten = Kitten.new(kitten_params)

    respond_to do |format|
      if @kitten.save
        format.html { redirect_to root_path, notice: 'Kitten was successfully created.' }
        format.json { render :show, status: :created, location: @kitten }
      else
        format.html { render :new }
        format.json { render json: @kitten.errors, status: :unprocessable_entity }
      end
    end 
  end


  # GET /kittens/1/edit
  def edit
  end

  def update
    respond_to do |format|
      if @kitten.update(kitten_params)
        format.html { redirect_to @kitten, notice: 'Kitten was successfully updated.' }
        format.json { render :show, status: :ok, location: @kitten }
      else
        format.html { render :edit }
        format.json { render json: @kitten.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @kitten.destroy
    respond_to do |format|
      format.html { redirect_to kittens_url, notice: 'Kitten was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end