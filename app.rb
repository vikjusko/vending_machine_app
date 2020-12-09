require "sinatra/base"

class Machine < Sinatra::Base

get "/" do
	"Wonna Snack?!"
end 


run! if app_file == $PROGRAM_NAME
end 