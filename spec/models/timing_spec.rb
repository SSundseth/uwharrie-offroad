require 'spec_helper'

describe Timing do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:trail_id) }
  it { should validate_presence_of(:seconds) }
  it { should validate_numericality_of(:seconds) }
end
