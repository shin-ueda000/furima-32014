require 'rails_helper'

RSpec.describe PurchaseForme, type: :model do
  before do
    @purchase_forme = FactoryBot.build(:purchase_forme)
  end

  describe '購入機能' do
    context '商品の購入ができる時' do
      it "全ての値が、正しく入力されている時" do
        expect(@purchase_forme).to be_valid
      end
      it "建物名が空でも保存できる" do
        @purchase_forme.building_name = ""
        expect(@purchase_forme).to be_valid
      end
    end

    context '商品の購入ができない時' do
      it "tokenが空では登録できないこと" do
        @purchase_forme.token = nil
        @purchase_forme.valid?
        expect(@purchase_forme.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号が空では登録できないこと" do
        @purchase_forme.postal_code = nil
        @purchase_forme.valid?
        expect(@purchase_forme.errors.full_messages).to include("Postal code can't be blank")
      end
      it "郵便番号にはハイフンが必要であること" do
        @purchase_forme.postal_code = "1234567"
        @purchase_forme.valid?
        expect(@purchase_forme.errors.full_messages).to include("Postal code is invalid")
      end
      it "都道府県についての情報がid[1]では登録出来ない" do
        @purchase_forme.shipping_area_id = 1
        @purchase_forme.valid?
        expect(@purchase_forme.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it "市区町村が空では登録できないこと" do
        @purchase_forme.municipalities = nil
        @purchase_forme.valid?
        expect(@purchase_forme.errors.full_messages).to include("Municipalities can't be blank")
      end
      it "番地が空では登録できないこと" do
        @purchase_forme.address = nil
        @purchase_forme.valid?
        expect(@purchase_forme.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空では登録できないこと" do
        @purchase_forme.phone_number = nil
        @purchase_forme.valid?
        expect(@purchase_forme.errors.full_messages).to include("Phone number can't be blank", "Phone number Too long too short,is invalid")
      end
      it "電話番号にはハイフンは不要であること" do
        @purchase_forme.phone_number = "000-000-000"
        @purchase_forme.valid?
        expect(@purchase_forme.errors.full_messages).to include("Phone number Too long too short,is invalid")
      end
      it "電話番号が11桁より大きいと登録できない" do
        @purchase_forme.phone_number = "000000000000"
        @purchase_forme.valid?
        expect(@purchase_forme.errors.full_messages).to include("Phone number Too long too short,is invalid")
      end
      it "user_idが空では登録できないこと" do
        @purchase_forme.user_id = nil
        @purchase_forme.valid?
        expect(@purchase_forme.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では登録できないこと" do
        @purchase_forme.item_id = nil
        @purchase_forme.valid?
        expect(@purchase_forme.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
