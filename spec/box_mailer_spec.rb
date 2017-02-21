require 'spec_helper'
require_relative '../lib/box_mailer'

describe BoxMailer do
  let(:users) do
    [
      { name: 'u1', received_contents: ['a', 'b'] },
      { name: 'u2', received_contents: ['b', 'c'] },
      { name: 'u3', received_contents: [] },
    ]
  end

  let(:box_mailer) { described_class.new(users) }

  describe '#find_unreceived_boxes' do
    let(:boxes) do
      [
        {code: 'b1', contents: ['a', 'b']},
        {code: 'b2', contents: ['b', 'c']},
        {code: 'b3', contents: ['c', 'd']},
      ]
    end

    subject { box_mailer.find_unreceived_boxes(boxes) }

    it "should return an array" do
      expect(subject).to be_a Array
    end

    it "should return users and the boxes they can receive without getting the same contents again" do
      expect(subject).to eq [
        {user: 'u1', boxes: ['b3']},
        {user: 'u2', boxes: []},
        {user: 'u3', boxes: ['b1', 'b2', 'b3']},
      ]
    end
  end
end
