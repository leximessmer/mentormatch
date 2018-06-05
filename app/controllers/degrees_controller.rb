class DegreesController < ApplicationController
  before_action :current_user_must_be_degree_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_degree_user
    degree = Degree.find(params[:id])

    unless current_user == degree.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Degree.ransack(params[:q])
    @degrees = @q.result(:distinct => true).includes(:user).page(params[:page]).per(10)

    render("degrees/index.html.erb")
  end

  def show
    @degree = Degree.find(params[:id])

    render("degrees/show.html.erb")
  end

  def new
    @degree = Degree.new

    render("degrees/new.html.erb")
  end

  def create
    @degree = Degree.new

    @degree.school = params[:school]
    @degree.degree = params[:degree]
    @degree.graduation_date = params[:graduation_date]
    @degree.user_id = params[:user_id]

    save_status = @degree.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/degrees/new", "/create_degree"
        redirect_to("/degrees")
      else
        redirect_back(:fallback_location => "/", :notice => "Degree created successfully.")
      end
    else
      render("degrees/new.html.erb")
    end
  end

  def edit
    @degree = Degree.find(params[:id])

    render("degrees/edit.html.erb")
  end

  def update
    @degree = Degree.find(params[:id])

    @degree.school = params[:school]
    @degree.degree = params[:degree]
    @degree.graduation_date = params[:graduation_date]

    save_status = @degree.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/degrees/#{@degree.id}/edit", "/update_degree"
        redirect_to("/degrees/#{@degree.id}", :notice => "Degree updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Degree updated successfully.")
      end
    else
      render("degrees/edit.html.erb")
    end
  end

  def destroy
    @degree = Degree.find(params[:id])

    @degree.destroy

    if URI(request.referer).path == "/degrees/#{@degree.id}"
      redirect_to("/", :notice => "Degree deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Degree deleted.")
    end
  end
end
