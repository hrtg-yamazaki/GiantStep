# Record登録のテスト

require "rails_helper"

RSpec.describe Record, type: :model do

  describe "records#create" do

    context "保存できる" do

      it "全てのカラムが埋まっていれば保存できる" do
        record = build(:record)
        record.valid?(:record_create)
        expect(record).to be_valid
      end

      it "sleepが0以上なら保存できる" do
        record = build(:record, sleep: 0 )
        record.valid?(:record_create)
        expect(record).to be_valid
      end

      it "sleepが2以下なら保存できる" do
        record = build(:record, sleep: 2 )
        record.valid?(:record_create)
        expect(record).to be_valid
      end

      it "studyが0以上なら保存できる" do
        record = build(:record, study: 0 )
        record.valid?(:record_create)
        expect(record).to be_valid
      end

      it "studyが2以下なら保存できる" do
        record = build(:record, study: 2 )
        record.valid?(:record_create)
        expect(record).to be_valid
      end

      it "exerciseが0以上なら保存できる" do
        record = build(:record, exercise: 0 )
        record.valid?(:record_create)
        expect(record).to be_valid
      end

      it "exerciseが2以下なら保存できる" do
        record = build(:record, exercise: 2 )
        record.valid?(:record_create)
        expect(record).to be_valid
      end

      it "dietが0以上なら保存できる" do
        record = build(:record, diet: 0 )
        record.valid?(:record_create)
        expect(record).to be_valid
      end

      it "dietが2以下なら保存できる" do
        record = build(:record, diet: 2 )
        record.valid?(:record_create)
        expect(record).to be_valid
      end

      it "habitが0以上なら保存できる" do
        record = build(:record, habit: 0 )
        record.valid?(:record_create)
        expect(record).to be_valid
      end

      it "habitが2以下なら保存できる" do
        record = build(:record, habit: 2 )
        record.valid?(:record_create)
        expect(record).to be_valid
      end

      it "aimが0以上なら保存できる" do
        record = build(:record, aim: 0 )
        record.valid?(:record_create)
        expect(record).to be_valid
      end

      it "aimが2以下なら保存できる" do
        record = build(:record, aim: 2 )
        record.valid?(:record_create)
        expect(record).to be_valid
      end

    end

    context "登録できない" do

      it "sleepが0未満では保存できない" do
        record = build(:record, sleep: (-1) )
        record.valid?(:record_create)
        expect(record.errors[:sleep]).to include("(睡眠)無効な値が検出されました")
      end

      it "sleepが3以上では保存できない" do
        record = build(:record, sleep: 3 )
        record.valid?(:record_create)
        expect(record.errors[:sleep]).to include("(睡眠)無効な値が検出されました")
      end

      it "sleepが文字列では保存できない" do
        record = build(:record, sleep: "aaa" )
        record.valid?(:record_create)
        expect(record.errors[:sleep]).to include("(睡眠)無効な値が検出されました")
      end

      it "studyが0未満では保存できない" do
        record = build(:record, study: (-1) )
        record.valid?(:record_create)
        expect(record.errors[:study]).to include("(勉強)無効な値が検出されました")
      end

      it "studyが3以上では保存できない" do
        record = build(:record, study: 3 )
        record.valid?(:record_create)
        expect(record.errors[:study]).to include("(勉強)無効な値が検出されました")
      end

      it "studyが文字列では保存できない" do
        record = build(:record, study: "aaa" )
        record.valid?(:record_create)
        expect(record.errors[:study]).to include("(勉強)無効な値が検出されました")
      end

      it "exerciseが0未満では保存できない" do
        record = build(:record, exercise: (-1) )
        record.valid?(:record_create)
        expect(record.errors[:exercise]).to include("(運動)無効な値が検出されました")
      end

      it "exerciseが3以上では保存できない" do
        record = build(:record, exercise: 3 )
        record.valid?(:record_create)
        expect(record.errors[:exercise]).to include("(運動)無効な値が検出されました")
      end

      it "exerciseが文字列では保存できない" do
        record = build(:record, exercise: "aaa" )
        record.valid?(:record_create)
        expect(record.errors[:exercise]).to include("(運動)無効な値が検出されました")
      end

      it "dietが0未満では保存できない" do
        record = build(:record, diet: (-1) )
        record.valid?(:record_create)
        expect(record.errors[:diet]).to include("(食事)無効な値が検出されました")
      end
      
      it "dietが3以上では保存できない" do
        record = build(:record, diet: 3 )
        record.valid?(:record_create)
        expect(record.errors[:diet]).to include("(食事)無効な値が検出されました")
      end

      it "dietが文字列では保存できない" do
        record = build(:record, diet: "aaa" )
        record.valid?(:record_create)
        expect(record.errors[:diet]).to include("(食事)無効な値が検出されました")
      end

      it "habitが0未満では保存できない" do
        record = build(:record, habit: (-1) )
        record.valid?(:record_create)
        expect(record.errors[:habit]).to include("(嗜好)無効な値が検出されました")
      end

      it "habitが3以上では保存できない" do
        record = build(:record, habit: 3 )
        record.valid?(:record_create)
        expect(record.errors[:habit]).to include("(嗜好)無効な値が検出されました")
      end

      it "habitが文字列では保存できない" do
        record = build(:record, habit: "aaa" )
        record.valid?(:record_create)
        expect(record.errors[:habit]).to include("(嗜好)無効な値が検出されました")
      end

      it "aimが0未満では保存できない" do
        record = build(:record, aim: (-1) )
        record.valid?(:record_create)
        expect(record.errors[:aim]).to include("(目標)無効な値が検出されました")
      end

      it "aimが3以上では保存できない" do
        record = build(:record, aim: 3 )
        record.valid?(:record_create)
        expect(record.errors[:aim]).to include("(目標)無効な値が検出されました")
      end

      it "aimが文字列では保存できない" do
        record = build(:record, aim: "aaa" )
        record.valid?(:record_create)
        expect(record.errors[:aim]).to include("(目標)無効な値が検出されました")
      end

    end

  end

end