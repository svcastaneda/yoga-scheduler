class YogaSessionsController < ApplicationController
# skip_before_filter  :verify_authenticity_token
  def create
    @yoga_session = YogaSession.new({user_id: session[:user_id], yoga_class_id: params[:yoga_class_id]})
    if @yoga_session.save
      redirect_to '/'
    else
      @errors = @yoga_session.errors.full_messages
      render template: 'yoga_classes/index'
    end
  end

  # private
  # def yoga_session_params
  #   params.require(:yoga_session).permit({user_id: session[:user_id], yoga_class_id: params[:yoga_class_id]})
  # end

end
