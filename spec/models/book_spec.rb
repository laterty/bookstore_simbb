require 'rails_helper'

RSpec.describe Book, type: :model do

  context 'when create book' do
    subject { Book.new(title: "Ruby is for fun", description: "yolo polo colo", price: 99.99, author: "Walter White" )}
    
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a title" do
      subject.title = nil
      expect(subject).to_not be_valid
    end
    
    it "is not valid without a description" do
      subject.description = nil
      expect(subject).to_not be_valid
    end
    
    it "is not valid without a author" do
      subject.author = nil
      expect(subject).to_not be_valid
    end
    
    it "is not valid without a price" do
      subject.price = nil
      expect(subject).to_not be_valid
    end
    
    it "is not valid with a text price" do
      subject.price = 'text_price'
      expect(subject).to_not be_valid
    end
  end
end
