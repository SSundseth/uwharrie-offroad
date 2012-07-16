require 'spec_helper'

describe Trail do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:length) }
  it { should validate_presence_of(:difficulty) }
end
