require 'sinatra'
require 'sinatra/reloader'


def check_guess(guess, number)
    if guess > number
      message = "Too high!"
        message = "Way too high!" if guess > (number + 5)
    elsif guess < number
      message = "Too low!"
        message = "Way too low!" if guess < (number - 5)
    else
      message = "You got it right! \n The SECRET number is #{number}"
    end
  message
end

def change_colour(guess, number)
  if guess < number
    colour = "crimson"
      colour = "darkred" if guess < (number - 5)
  elsif guess > number
    colour = "crimson"
        colour = "darkred" if guess > (number + 5)
  else
    colour = "green"
  end
  colour
end

number = rand(100)

get '/' do
  guess   = params["guess"].to_i
  message = check_guess(guess, number)
  colour  = change_colour(guess, number)
  erb :index, :locals => {:message => message, :colour => colour}
end
