require 'test_helper'

class GameControllerTest < ActionController::TestCase
	test "should get index" do
		get :index
		assert_response :success
	end

	test 'should only allow defined signs' do
		post :throw, {:sign => 'bad'}
		assert_response :error
	end

	test 'should respond if a sign is allowed' do
		post :throw, {:sign => 'rock'}
		assert_response :success
	end

	test 'should declare win, loss, or a tie' do
		results = /(win|lose|tie)/

		post :throw, {:sign => 'rock'}

		assert(response.body.match(results))
	end
end
