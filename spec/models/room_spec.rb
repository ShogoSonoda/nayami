require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end

  describe 'ルーム新規作成' do
    it 'nameが存在しないと作成できないこと' do
      expect(@room).to be_valid
    end
  end
end
