class DashboardController < ApplicationController

  layout 'mobile'

  def landing_page

  end

  def choose_challenge
    @hunts = Hunt.all
  end

  def view_hunt

    if current_user.blank?
      redirect_to '/'
      return
    end

    hunt_id = params[:hunt].to_i
    @hunt = Hunt.find(hunt_id)
    @done_task_ids = current_user.tasks.where(hunt_id: @hunt.id).pluck(:task_id)

  end

  def get_hunt_tasks
    params[:hunt_id] = Hunt.first.id

    tasks = Task.where(hunt_id: params[:hunt_id])
    done_task_ids = current_user.tasks.where(hunt_id: params[:hunt_id]).pluck(:task_id)

    render json: { tasks: tasks, done_task_ids: done_task_ids }
  end

  def get_task_view
    @task = Task.find_by(id: params[:task_id])
    @task_done = UserTask.where(user_id: current_user.id, task_id: @task.id).count > 0

    render partial: '/dashboard/task_view'
  end

  def mark_task_as_done

    @task = Task.find_by(id: params[:task_id])

    UserTask.where(
      user_id: current_user.id,
      task_id: @task.id
    ).first_or_create()

    @task_done = true

    render partial: '/dashboard/task_view'
  end

end
