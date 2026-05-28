class StudentsController < ApplicationController
  before_action :authenticate_student!, only: [:destroy]

  def create
    student = Student.new(student_params)

    if student.save
      token = generate_token(student.id)
      render json: StudentSerializer.render(student),
             status: :created,
             headers: { 'X-Auth-Token' => token }
    else
      render json: { error: 'Invalid input' }, status: 405
    end
  end

  def destroy
    student = Student.find_by(id: params[:id])
    return render json: { error: 'Некорректный id студента' }, status: :bad_request if student.nil?

    student.destroy
    head :no_content
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :surname, :class_id, :school_id)
  end

  def generate_token(student_id)
    Digest::SHA256.hexdigest("#{student_id}#{SECRET_SALT}")
  end
end
