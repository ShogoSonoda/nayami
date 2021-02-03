require 'rails_helper'

RSpec.describe Answer, type: :model do
  before do
    @answer = FactoryBot.build(:answer)
  end

  describe '解決策投稿' do
    context '解決策投稿ができる場合' do
      it 'textが存在すれば投稿できること' do
        expect(@answer).to be_valid
      end
    end

    context '解決策投稿ができない場合' do
      it 'textが空では投稿できないこと' do
        @answer.text = ''
        @answer.valid?
        expect(@answer.errors.full_messages).to include("Text can't be blank")
      end

      it '紐づく悩み投稿が存在しないと投稿できないこと' do
        @answer.problem = nil
        @answer.valid?
        expect(@answer.errors.full_messages).to include('Problem must exist')
      end

      it '紐づくユーザーが存在しないと投稿できないこと' do
        @answer.user = nil
        @answer.valid?
        expect(@answer.errors.full_messages).to include('User must exist')
      end
    end
  end
end
