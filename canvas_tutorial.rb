class CanvasTutorialApp < Sinatra::Base

	get '/' do
		haml :index
	end
end
