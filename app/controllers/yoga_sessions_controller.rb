class YogaSessionsController < ApplicationController
# skip_before_filter  :verify_authenticity_token
  def new
  end

  def create
    @user = User.find(session[:user_id])
    class_id = params[:yoga_class_id]
    if YogaSession.where(user_id: @user.id, yoga_class_id: class_id).empty?
      @yoga_session = YogaSession.new({user_id: @user.id, yoga_class_id: class_id})
      if @yoga_session.save
        # UserMailer.signup_email(@user, @yoga_session).deliver_later
        redirect_to '/'
      else
        @errors = @yoga_session.errors.full_messages
        render template: 'yoga_classes/index'
      end
    else
      @errors = ["You're already signed up for that session"]
      @yoga_classes = YogaClass.all
      render template: 'yoga_classes/index'
    end
  end
  
  def destroy
    class_id = params[:yoga_class_id]
    @yoga_session = YogaSession.find_by({user_id: current_user.id, yoga_class_id: class_id})
    @yoga_session.destroy
    redirect_to '/'
  end

  private
    # def yoga_session_params
#       params.require(:yoga_session).permit({user_id: session[:user_id], yoga_class_id: params[:yoga_class_id]})
#     end
  
    def current_user
      return nil if session[:user_id].nil?
      User.find_by(id: session[:user_id])
    end

end
