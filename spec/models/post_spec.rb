# frozen_string_literal: true

require "rails_helper"

RSpec.describe Post, type: :model do

  it "is valid" do
    expect(build(:post)).to be_valid
  end

  it "is invalid without a title" do
    expect(build(:post, title: "missing title")).to be_invalid
  end

  it "is invalid with too short content" do
    expect(build(:post, content: "so short")).to be_invalid
  end

  it "is invalid with a long summary" do
    expect(build(:post, summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet luctus felis. Sed in leo sed erat accumsan interdum. Vivamus orci dolor, sagittis vitae tempor luctus, ullamcorper ut urna. In in turpis in odio porttitor porttitor. Integer sed..")).to be_invalid
  end

  it "is invalid with a category outside the choices" do
    expect(build(:post, category: "Sparkley Vampires")).to be_invalid
  end

  it "is invalid if not clickbait" do
    expect(build(:post, title: "Yuge")).to be_invalid
  end

  it "has a valid factory" do
    expect(build(:post)).to be_valid
  end
end
