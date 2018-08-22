require 'spec_helper'

RSpec.describe Stack do
  let(:stack) { Stack.new }

  describe "#push" do
    subject { stack.push 1 }

    it { expect(subject).to eq stack }

    #context "1 を push 済みの stack" do
    #  before { stack.push 1 }

    #  describe "length が 1" do
    #    subject { stack.length }
    #    it { expect(subject).to eq 1 }
    #  end

    #end

    #context "1 と 5 を push 済みのstack" do
    #  before do
    #    stack.push 1
    #    stack.push 5
    #  end

    #  subject { stack.length }
    #  describe "length が 2" do
    #    it { expect(subject).to eq 2 }
    #  end
    #end
  end

  describe "#length" do
    subject { stack.length }

    context "1 を push 済みの stack" do
      before { stack.push 1 }
      it { expect(subject).to eq 1 }
    end

    context "1 と 5 を push 済みのstack" do
      before do
        stack.push 1
        stack.push 5
      end
      it { expect(subject).to eq 2 }
    end

    context "1 と 5 を push したあと 1度 pop したstack" do
      before do
        stack.push 1
        stack.push 5
        stack.pop
      end
      it { expect(subject).to eq 1 }
    end
  end

  describe "#pop" do
    subject { stack.pop }

    context "空の stack" do
      it { expect{subject}.to raise_error StandardError }
    end

    context "1 と 5 を push済みのstack" do
      before do
        stack.push 1
        stack.push 5
      end

      it { expect(subject).to eq 5 }
    end
  end

  describe "#empty?" do
    subject { stack.empty? }

    context "空の stack" do
      it { expect(subject).to eq true }
    end

    context "1 と 5 を push済みのstack" do
      before do
        stack.push 1
        stack.push 5
      end

      it { expect(subject).to eq false }
    end
  end
end
