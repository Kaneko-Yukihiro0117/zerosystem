require 'rails_helper'

describe Shop, type: :model do
  describe '#create' do
    before do
      @shop = FactoryBot.build(:shop)
    end

    context '登録できる' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@shop).to be_valid
      end
    end
    context "登録できない" do
      it 'item_nameが空の場合は登録できないこと' do
        @shop.item_name = nil
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Item nameを入力してください")
      end
      it 'store_nameが空の場合は登録できないこと' do
        @shop.store_name = nil
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Store nameを入力してください")
      end
      it 'detailが空の場合は登録できないこと' do
        @shop.detail = nil
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Detailを入力してください")
      end
      it 'category_idが空の場合は登録できないこと' do
        @shop.category_id = nil
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Categoryは数値で入力してください")
      end
      it 'latitudeが空の場合は登録できないこと' do
        @shop.latitude = nil
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Latitudeは不正な値です")
      end
      it 'longitudeが空の場合は登録できないこと' do
        @shop.longitude = nil
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Longitudeは不正な値です")
      end
      it 'imageが空の時、保存されない' do
        @shop.image = nil
        @shop.valid?
        expect(@shop.errors.full_messages).to include('Imageを入力してください')
      end
      it 'category_idがid:0の時、保存されない' do
        @shop.category_id = 0
        @shop.valid?
        expect(@shop.errors.full_messages).to include('Categoryは0以外の値にしてください')
      end
      it 'latitudeに中間に.がない場合時、保存されない' do
        @shop.latitude = 1111111111
        @shop.valid?
        expect(@shop.errors.full_messages).to include('Latitudeは不正な値です')
      end
      it 'longitudeに中間に.がない場合時、保存されない' do
        @shop.longitude = 1111111111
        @shop.valid?
        expect(@shop.errors.full_messages).to include('Longitudeは不正な値です')
      end
    end
    context 'アソシエーション関連' do
      it 'userと紐づいていないと保存できない' do
        @shop.user = nil
        @shop.valid?
        expect(@shop.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end