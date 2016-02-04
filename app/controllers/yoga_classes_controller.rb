class YogaClassesController < ApplicationController
  def index
    @yoga_classes = YogaClass.all
  end
  def create
    @yoga_class = YogaClass.new(yoga_class_params)

    @yoga_class.save
    redirect_to @yoga_class
  end
  def show
    @yoga_class = YogaClass.find(params[:id])
  end
  def new
  end

  private 
    def yoga_class_params
      params.require(:yoga_class).permit(:date, :time, :size)
    end

end
