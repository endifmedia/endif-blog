class JobsController < ApplicationController
  
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @jobs = Job.all
  end

  def show
  end

  def new
    @job = Job.new
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to jobs_url, notice: 'Job was successfully updated.'
    else
      render :edit
      flash[:danger] = 'Something went wrong.'
    end
  end
 
  def create
    @job = Job.new(job_params)
    @job.user = current_user

    if @job.save
      redirect_to jobs_url, notice: 'Job was successfully created.'
    else
      render :new
      flash[:danger] = 'Something went wrong.'
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_url, notice: 'Job was successfully deleted.'
  end
  
  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:company, :content, :featured_image, :remoteness, :website, :marketing_blurb, :staff)
  end

  def require_same_user
    if current_user != @job.user
      flash[:danger] = 'You can only edit or delete your own posts.'
      redirect_to root_path
    end
  end

end