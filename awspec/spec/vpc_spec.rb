require 'spec_helper'

describe vpc('VPC領域') do
  it { should exist }
  it { should be_available }
  its(:cidr_block) { should eq '10.0.0.0/16' }
  it { should have_tag('Name').value('VPC領域') }
  it { should have_route_table('パブリックルートテーブル') }
end
