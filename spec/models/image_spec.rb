require "spec_helper"

describe Image do
  it "builds a valid object" do
    image = create(:image)
    image.should be_valid
  end
end

