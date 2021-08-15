require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to validate_presence_of :message }
  it { is_expected.to belong_to :video }
end
