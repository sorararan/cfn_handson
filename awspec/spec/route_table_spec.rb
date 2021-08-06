require 'spec_helper'

describe route_table('パブリックルートテーブル') do
  it { should exist }
  it { should belong_to_vpc('VPC領域') }
  it { should have_tag('Name').value('パブリックルートテーブル') }
end
