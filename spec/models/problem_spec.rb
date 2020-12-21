require 'rails_helper'

RSpec.describe Problem, type: :model do
  before do
    @problem = FactoryBot.build(:problem)
  end

  describe '悩み投稿' do
    context '悩み投稿ができる場合' do
      it "title,textが存在すれば投稿できること" do
        expect(@problem).to be_valid
      end
    end

    context '悩み投稿ができない場合' do
      it "titleが空では投稿できないこと" do
        @problem.title = ""
        @problem.valid?
        expect(@problem.errors.full_messages).to include("Title can't be blank")
      end

      it "textが空では投稿できないこと" do
        @problem.text = ""
        @problem.valid?
        expect(@problem.errors.full_messages).to include("Text can't be blank")
      end

      it "紐づくユーザーが存在しないと投稿できないこと" do
        @problem.user = nil
        @problem.valid?
        expect(@problem.errors.full_messages).to include("User must exist")
      end
    end
  end
end
