require "rails_helper"

describe Observation do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a first_name" do
        section = Section.create(name: "literacy")
        student = section.students.new(last_name: "Smith")
        expect(student).to be_invalid
      end

      it "is invalid without a last_name" do
        section = Section.create(name: "literacy")
        student = section.students.new(first_name: "Johnny")
        expect(student).to be_invalid
      end
    end
    context "valid attributes" do
      it "is valid with a first_name and last_name" do
        section = Section.create(name: "literacy")
        student = section.students.new(first_name: "Johnny", last_name: "Smith")
        expect(student).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has_many sections" do
      section = Section.create(name: "literacy")
      student = section.students.new(first_name: "Johnny", last_name: "Smith")
      expect(student).to respond_to(:section)
    end

    it "has_many observations" do
        section = Section.create(name: "literacy")
        student = section.students.new(first_name: "Johnny", last_name: "Smith")
        expect(student).to respond_to(:observation)
      end
    end
  end
end
