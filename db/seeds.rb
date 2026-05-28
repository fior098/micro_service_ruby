school = School.create!(name: 'Школа №1')

class1 = SchoolClass.create!(school: school, number: 1, letter: 'А')
class2 = SchoolClass.create!(school: school, number: 2, letter: 'Б')

Student.create!(first_name: 'Иван', last_name: 'Иванов', surname: 'Иванович', class_id: class1.id, school_id: school.id)
Student.create!(first_name: 'Мария', last_name: 'Петрова', surname: 'Сергеевна', class_id: class2.id, school_id: school.id)
