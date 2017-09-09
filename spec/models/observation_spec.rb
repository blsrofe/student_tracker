require "rails_helper"

describe Observation do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a date" do
        student = Student.create(first_name: "Johnny", last_name: "Smith")
        observation = student.observations.new(content: "This is content", teacher: "Jane Doe")
        expect(observation).to be_invalid
      end

      it "is invalid without content" do
        student = Student.create(first_name: "Johnny", last_name: "Smith")
        observation = student.observations.new(date: "05-02-2000", teacher: "Jane Doe")
        expect(observation).to be_invalid
      end

      it "is invalid without a teacher" do
        student = Student.create(first_name: "Johnny", last_name: "Smith")
        observation = student.observations.new(content: "This is content", date: "05-02-2000")
        expect(observation).to be_invalid
      end
    end
    context "valid attributes" do
      it "is valid with a date, teacher, and content" do
        student = Student.create(first_name: "Johnny", last_name: "Smith")
        observation = student.observations.new(content: "This is content", date: "05-02-2000", teacher: "Jane Doe")
        expect(observation).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to students" do
      student = Student.create(first_name: "Johnny", last_name: "Smith")
      observation = student.observations.new(content: "This is content", date: "05-02-2000", teacher: "Jane Doe")
      expect(observation).to respond_to(:student)
    end
  end
end
