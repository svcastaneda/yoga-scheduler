class YogaClassesController < ApplicationController
  def index
    @yoga_classes = YogaClass.all.order(date: :asc).where('date >= ?', Date.today)
  end
  def create
    @yoga_class = YogaClass.new(yoga_class_params)

    if @yoga_class.save
      redirect_to @yoga_class
    else
      render template: 'yoga_classes/new'
    end
  end
  def show
    @yoga_class = YogaClass.find(params[:id])
  end
  def new
    redirect_to '/login' if current_user.nil?
  end

  private
    def yoga_class_params
      params.require(:yoga_class).permit(:date, :size)
    end
    
    def current_user
      return nil if session[:user_id].nil?
      User.find_by(id: session[:user_id])
    end

end
