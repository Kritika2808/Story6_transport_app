class FooController < ApplicationController
	def bar
		authorize User
		p 111111
		p current_user
		p 111111
		head :ok
	end
end
