require 'sinatra'
require 'sinatra/reloader'


def check_guess(guess, number)
    if guess.to_i > number
      message = "Too high!"
        message = "Way too high!" if guess.to_i > (number + 5)
    elsif guess.to_i < number
      message = "Too low!"
        message = "Way too low!" if guess.to_i < (number - 5)
    else
      message = "You got it right! \n The SECRET number is #{number}"
    end
  message
end

number = rand(100)

get '/' do
  guess = params["guess"]
  message = check_guess(guess, number)
  erb :index, :locals => {:message => message}
end
