require 'spec_helper'

describe 'nginx::default' do
	describe port(80) do
	  it { should be_listening }
	end
end
