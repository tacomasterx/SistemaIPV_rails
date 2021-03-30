class ApplicationController < ActionController::Base

  def activity_log activity, user, time
    # model = Log.new(activity: activity, user_id: user, date: time)
    # model.save
    puts "Se hizo #{activity} el día #{time} por el empleado: #{user}."
  end

end
