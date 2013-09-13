require "spec_helper"

describe User do
  it "builds a valid object" do
    user = create(:user)
    user.should be_valid
  end

  it "builds a valid object :with_image" do
    user = create(:user, :with_image)
    Image.count.should > 0
    user.should be_valid
    user.image.should_not == nil
  end
end

