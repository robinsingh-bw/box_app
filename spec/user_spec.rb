require 'spec_helper'

describe User do
  let(:user) { described_class.new('john', ['a', 'b']) }

  it "should have a name" do
    expect(user.name).to eq 'john'
  end

  it "should have received contents" do
    expect(user.received_contents).to eq ['a', 'b']
  end

  describe '#has_received_any?' do
    subject { user.has_received_any?(items) }

    context 'with received items' do
      let(:items) { ['a'] }

      it "should return true" do
        expect(subject).to be true
      end

      it "should return true even if array contains some unreceived items" do
        items << 'c' << 'd'
        expect(subject).to be true
      end
    end

    context 'with unreceived items' do
      let(:items) { ['c'] }

      it "should return false" do
        expect(subject).to be false
      end
    end
  end
end
