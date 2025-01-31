
require 'rails_helper'

RSpec.describe 'Openai Service' do
  it 'ask should return hello world' do
    allow_any_instance_of(OpenAI::Client).to receive(:chat).and_return({ 'choices' => [{ 'message'=> { 'content'=> 'hello world!' } }] })

    service = OpenaiService.new('say "hello world!" without quotes')
    expect(service.ask).to eq('hello world!')
  end
end
