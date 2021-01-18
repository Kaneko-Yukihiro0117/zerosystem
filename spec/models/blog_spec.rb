require 'rails_helper'
describe Blog do
  describe '#create' do
    before do
      @blog = FactoryBot.build(:blog)
    end
    context '登録できる' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@blog).to be_valid
      end
    end
    context "登録できない" do
      it 'titleが空の場合は登録できないこと' do
        @blog.title = nil
        @blog.valid?
        expect(@blog.errors.full_messages).to include("Titleを入力してください")
      end
      it 'planが空の場合は登録できないこと' do
        @blog.plan = nil
        @blog.valid?
        expect(@blog.errors.full_messages).to include("Planを入力してください")
      end
      it 'start_timeが空の場合は登録できないこと' do
        @blog.start_time = nil
        @blog.valid?
        expect(@blog.errors.full_messages).to include("Start timeを入力してください")
      end
    end
    context 'アソシエーション関連' do
      it 'userと紐づいていないと保存できない' do
        @blog.user = nil
        @blog.valid?
        expect(@blog.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end