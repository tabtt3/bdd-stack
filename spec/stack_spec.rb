require 'spec_helper'

RSpec.describe Stack do
  let(:stack) { Stack.new }

  describe "#push" do
    subject { stack.push 1 }
    it { expect(subject).to eq stack }
  end

  context "1 を push 済みの stack" do
    before { stack.push 1 }
    describe "length が 1" do
      subject { stack.length }
      it { expect(subject).to eq 1 }
    end
  end
end
