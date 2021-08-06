require 'spec_helper'

describe subnet('パブリックサブネット') do
  it { should exist }
  it { should be_available }
  it { should belong_to_vpc('VPC領域') }
  its(:availability_zone) { should eq 'ap-northeast-1d' }
  its(:cidr_block) { should eq '10.0.1.0/24' }
  it { should have_tag('Name').value('パブリックサブネット') }
end
