# frozen_string_literal: true

require 'rails_helper'

describe Episode, type: :model do
  let(:episode) { build(:episode) }

  it 'as_json' do
    result = episode.as_json

    expect(result[:identifier]).to eq(episode.identifier)
    expect(result[:name]).to eq(episode.name)
    expect(result[:video_url].length).to be
  end
end
