# frozen_string_literal: true

require 'rails_helper'

describe Show, type: :model do
  let(:show) { build(:show, episodes: build_list(:episode, 3)) }

  it 'as_json' do
    result = show.as_json

    expect(result[:identifier]).to eq(show.identifier)
    expect(result[:name]).to eq(show.name)
    expect(result[:episodes].length).to eq(3)
  end
end
