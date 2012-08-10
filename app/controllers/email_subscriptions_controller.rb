class EmailSubscriptionsController < ActionController::Base

  def create
    @email_subscription = EmailSubscription.new(params[:email_subscription])

    respond_to do |format|
      if @email_subscription.save
        format.html { redirect_to root_path, notice: 'Thanks!' }
        format.json { render json: root_path, status: :created, location: @email_subscription }
      else
        format.html { redirect_to root_path, alert: 'Invalid Email' }
        format.json { render json: @email_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @email_subscriptions = EmailSubscription.all
  end

end


