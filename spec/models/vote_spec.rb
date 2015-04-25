require 'rails_helper'

describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        post = Post.create(title: 'post title', body: 'post body must be pretty long.')

        vote = Vote.create(value: 1, post: post)
        expect( vote.value ).to eq(1)

        vote = Vote.create(value: -1, post: post)
        expect( vote.value ).to eq(-1)
      end
    end
  end
end