require 'swagger_helper'

RSpec.describe 'Blogs API' do

  path '/api/v1/users/{id}/posts' do

    get 'Retrieves posts of the user' do
      tags 'Posts'
      produces 'application/json'
      parameter name: 'user_id', in: :path, type: :integer, description: 'user_id'

      response '200', 'Comment found' do
        let(:user_id) { '123' }

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
