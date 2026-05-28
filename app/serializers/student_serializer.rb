class StudentSerializer < Blueprinter::Base
  identifier :id

  fields :first_name, :last_name, :surname, :class_id, :school_id

  def self.render_collection(students)
    { data: students.map { |s| render_as_hash(s) } }.to_json
  end
end
