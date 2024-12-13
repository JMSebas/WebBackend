class SubjectsController < ApplicationController
  before_action :set_subject, only: %i[ show update destroy ]
  before_action :authenticate_with_uuid!

  # GET /subjects
  def index
    if current_user
      @subjects = current_user.subjects
      render json: @subjects
    else 
      render json: { error: "No se encontraron materias para este usuario" }, status: :not_found
    end
  end

  # GET /subjects/1
  def show
    render json: @subject
  end

  # POST /subjects
  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      render json: @subject, status: :created, location: @subject
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subjects/1
  def update
    if @subject.update(subject_params)
      render json: @subject
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subjects/1
  def destroy
    @subject.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subject_params
      params.require(:subject).permit(:name, :professor, :credits, :status, :final_grade, :semester_id, :schedule_id)
    end
end
