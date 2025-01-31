require 'rails_helper'

RSpec.describe 'OpenAI Request', type: :request do
  it 'returns a response' do
    allow(OpenaiService).to receive(:new)
      .with('say "hello world!" without quotes')
      .and_return(double(ask: 'hello world!'))

    get '/ask', params: { q: 'say "hello world!" without quotes' }

    expect(response).to be_successful
    expect(JSON.parse(response.body)).to eq({ 'message' => 'hello world!' })
    expect(OpenaiService).to have_received(:new).with('say "hello world!" without quotes')
  end
end
