class DashboardController < ApplicationController

  layout 'mobile'

  def landing_page

  end

  def view_hunt

    @hunt = Hunt.first

  end

  def get_hunt_tasks
    params[:hunt_id] = Hunt.first.id

    tasks = Task.where(hunt_id: params[:hunt_id])

    render json: tasks
  end

  def get_task_view
    @task = Task.find_by(id: params[:task_id])

    render partial: '/dashboard/task_view'
  end

end
