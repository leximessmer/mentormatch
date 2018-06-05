class JobsController < ApplicationController
  before_action :current_user_must_be_job_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_job_user
    job = Job.find(params[:id])

    unless current_user == job.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @jobs = Job.all

    render("jobs/index.html.erb")
  end

  def show
    @job = Job.find(params[:id])

    render("jobs/show.html.erb")
  end

  def new
    @job = Job.new

    render("jobs/new.html.erb")
  end

  def create
    @job = Job.new

    @job.job_title = params[:job_title]
    @job.employer = params[:employer]
    @job.start_date = params[:start_date]
    @job.end_date = params[:end_date]
    @job.industry = params[:industry]
    @job.user_id = params[:user_id]

    save_status = @job.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/jobs/new", "/create_job"
        redirect_to("/jobs")
      else
        redirect_back(:fallback_location => "/", :notice => "Job created successfully.")
      end
    else
      render("jobs/new.html.erb")
    end
  end

  def edit
    @job = Job.find(params[:id])

    render("jobs/edit.html.erb")
  end

  def update
    @job = Job.find(params[:id])

    @job.job_title = params[:job_title]
    @job.employer = params[:employer]
    @job.start_date = params[:start_date]
    @job.end_date = params[:end_date]
    @job.industry = params[:industry]
    @job.user_id = params[:user_id]

    save_status = @job.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/jobs/#{@job.id}/edit", "/update_job"
        redirect_to("/jobs/#{@job.id}", :notice => "Job updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Job updated successfully.")
      end
    else
      render("jobs/edit.html.erb")
    end
  end

  def destroy
    @job = Job.find(params[:id])

    @job.destroy

    if URI(request.referer).path == "/jobs/#{@job.id}"
      redirect_to("/", :notice => "Job deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Job deleted.")
    end
  end
end
