class BuddiesController < ApplicationController
  def index
    @buddies = Buddie.all
  end

  def new
    @buddie = Buddie.new
  end

  def show
    @buddie = Buddie.find(params[:id])
  end

  def create
    @buddie = Buddie.new(buddie_params)
    if @buddie.save
      redirect_to buddies_path
    else
      render 'new'
    end
  end

  def update
    @buddie = current_user.buddies.find(params[:id])

    if @buddie.update(buddie_params)
      redirect_to buddies_path, notice: 'Buddie was updated.'
    else
      render :edit
    end
  end

  def destroy
    @buddie = Buddie.find(params[:id])
    @buddie.destroy
    redirect_to buddies_path
  end

  private

  def buddie_params
    params.require(:buddie).permit(:name, :personality, :image_url)
  end
end
