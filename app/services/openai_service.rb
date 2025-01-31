require 'openai'

class OpenaiService
  def initialize(question)
    @question = question
  end

  def ask
    client = OpenAI::Client.new(
      log_errors: true
    )
    response = client.chat(
      parameters: {
        model: 'gpt-4o',
        messages: [{ role: 'user', content: @question }]
      }
    )
    response.dig('choices', 0, 'message', 'content')
  end
end
