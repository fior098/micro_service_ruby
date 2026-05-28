class ApplicationController < ActionController::API
  SECRET_SALT = ENV.fetch('SECRET_SALT', 'default_secret_salt')

  def authenticate_student!
    token = request.headers['Authorization']&.sub('Bearer ', ''
    return render json: { error: 'Некорректная авторизация' }, status: :unauthorized if token.blank?

    student_id = find_student_id_by_token(token)
    return render json: { error: 'Некорректная авторизация' }, status: :unauthorized if student_id.nil?

    @current_student = Student.find_by(id: student_id)
    render json: { error: 'Некорректная авторизация' }, status: :unauthorized if @current_student.nil?
  end

  private

  def find_student_id_by_token(token)
    Student.find_each do |student|
      expected = Digest::SHA256.hexdigest("#{student.id}#{SECRET_SALT}")
      return student.id if expected == token
    end
    nil
  end
end
