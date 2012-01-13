require 'spec_support'

describe 'validate_presence_of' do

  describe User do
    it { should validate_presence_of :name }
    it { should_not validate_presence_of :age }
  end

end
