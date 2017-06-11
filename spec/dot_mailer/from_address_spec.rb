require 'spec_helper'

describe DotMailer::FromAddress do
  let(:id)    { double 'id' }
  let(:email) { double 'email' }

  let(:attributes) do
    {
      'id'    => id,
      'email' => email
    }
  end

  subject { DotMailer::FromAddress.new(attributes) }

  it { subject.id.should == id }
  it { subject.email.should == email}
  it { subject.to_hash.should == attributes }

  describe '#==' do
    it 'should equal a from address with the same attributes' do
      subject.should == DotMailer::FromAddress.new(attributes)
    end
  end
end
