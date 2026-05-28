module Schools
  class ClassStudentsController < ApplicationController
    def index
      school_class = SchoolClass.find_by(id: params[:class_id], school_id: params[:school_id])
      return render json: { data: [] } if school_class.nil?

      students = school_class.students
      render json: StudentSerializer.render_collection(students)
    end
  end
end
