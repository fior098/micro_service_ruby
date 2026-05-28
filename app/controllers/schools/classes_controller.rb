module Schools
  class ClassesController < ApplicationController
    def index
      school_id = params[:school_id]
      classes = SchoolClass.where(school_id: school_id).includes(:students)
      render json: ClassSerializer.render_collection(classes)
    end
  end
end
