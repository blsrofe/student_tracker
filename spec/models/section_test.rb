require 'rails_helper'

describe Section do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without name" do
        teacher = Teacher.create(first_name: "Jane", last_name: "Doe", username: "jdoe23", password: "123")
        section = teacher.sections.create
        expect(section).to be_invalid
      end
    end
    context "valid attributes" do
      it "is valid with a name" do
        teacher = Teacher.create(first_name: "Jane", last_name: "Doe", username: "jdoe23", password: "123")
        section = teacher.sections.create(name: "literacy")
        expect(section).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to teachers" do
      teacher = Teacher.create(first_name: "Jane", last_name: "Doe", username: "jdoe23", password: "123")
      section = teacher.sections.create(name: "literacy")
      expect(section).to respond_to(:teacher)
    end

    it "has many students" do
      teacher = Teacher.create(first_name: "Jane", last_name: "Doe", username: "jdoe23", password: "123")
      section = teacher.sections.create(name: "literacy")
      expect(section).to respond_to(:student)
    end
  end
end
