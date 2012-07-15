require 'spec_helper'

describe User do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:password) }
  it { should validate_confirmation_of(:password) }
end
