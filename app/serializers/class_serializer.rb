class ClassSerializer < Blueprinter::Base
  identifier :id

  fields :number, :letter

  field :students_count do |school_class|
    school_class.students.size
  end

  def self.render_collection(classes)
    { data: classes.map { |c| render_as_hash(c) } }.to_json
  end
end
