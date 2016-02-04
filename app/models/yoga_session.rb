class YogaSession < ActiveRecord::Base
  belongs_to :user
  belongs_to :yoga_class

  def create
    @yoga_session = YogaSession.new(params[:yoga_session])
    if @yoga_session.save
      redirect_to @yoga_class
    else
      @errors = @yoga_session.errors.full_messages
      render template: 'yoga_classes/index'
    end
  end
end
