require 'rails_helper'

describe User do
  include TestFactories

  describe "#favorited(post)" do
    before do
      @post = associated_post
      @user = authenticated_user
    end

    it "returns 'nil' if the user has not favorited the post" do
        expect(@user.favorited(@post)).to eq(nil)
    end
    
    it "returns the appropriated favorite if it exists" do
      favorite = @user.favorites.create(post: @post)
      expect(@user.favorited(@post)).to eq(favorite)
    end

    it "returns 'nil' if the user has favorited another post" do
        post2 = associated_post(title: "Post 2")
        favorite = @user.favorites.create(post: post2)
        expect(@user.favorited(@post)).to eq(nil)
    end
  end
end