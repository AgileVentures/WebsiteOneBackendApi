# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :find_project, only: %i[update destroy show]

  def index
    @projects = Project.all
    render json: @projects, status: :ok
  end
  def show
    render json: @project
  end
  def create
    @project = Project.create(project_params)

    if @project.save
      render json: @project, status: :created
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end


  def update
    if @project.update(project_params)
      render json: @project, status: :ok
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end


  def destroy
    @project.destroy
    head :no_content
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :image_url, :status, :github_url,
                                    :issue_tracker, :slack_channel_title)
  end
end
