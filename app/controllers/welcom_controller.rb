class WelcomController < ApplicationController
  PER = 10

  def index
    # 10件毎にページング行う.
    @events = Event.page(params[:page]).per([PER])
      .where('start_time > ?', Time.zone.now).order(:start_time)
  end
end
