require 'spec_helper'

describe Division do
  it { should have_and_belong_to_many :employees }
end
