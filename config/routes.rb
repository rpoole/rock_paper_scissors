Rails.application.routes.draw do
  get 'game/index'
	root 'game#index'

	post 'game/throw' => 'game#throw'
end
