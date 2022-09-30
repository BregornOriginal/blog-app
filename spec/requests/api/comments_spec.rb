require 'swagger_helper'

RSpec.describe 'Blogs API' do
  path '/api/v1/users/{id}/posts/{id}/comments' do
    get 'Retrieves comments of a post of the user' do
      tags 'GET Comments'
      produces 'application/json'
      parameter name: 'user_id', in: :path, type: :integer, description: 'user_id'
      parameter name: 'post_id', in: :path, type: :integer, description: 'post_id'

      response '200', 'Comment found' do
        let(:user_id) { '123' }
        let(:post_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create comment') do
      tags 'POST Comments'
      response(200, 'successful') do
        let(:user_id) { '123' }
        let(:post_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
