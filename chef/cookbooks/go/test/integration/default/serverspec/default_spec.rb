require 'spec_helper'

describe 'go::default' do
	describe port(8484) do
  		it { should be_listening }
  	end
end
