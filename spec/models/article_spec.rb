require 'rails_helper'

RSpec.describe Article, type: :model do
  subject { described_class.new(title: "My First Article", description: "This is a test article.") }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).not_to be_valid
    expect(subject.errors[:title]).to include("can't be blank")
  end

  it "is not valid without a description" do
    subject.description = nil
    expect(subject).not_to be_valid
    expect(subject.errors[:description]).to include("can't be blank")
  end

  it "is not valid with a generic title" do
    subject.title = "Untitled"
    expect(subject).not_to be_valid
    expect(subject.errors[:title]).to include("is too generic")
  end

  it "is not valid with a duplicate title" do
    Article.create!(title: "Unique Title", description: "Something here.")
    duplicate = Article.new(title: "Unique Title", description: "Another one.")
    expect(duplicate).not_to be_valid
    expect(duplicate.errors[:title]).to include("has already been taken")
  end
end
