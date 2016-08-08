require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)

def check_guess(guess)
  return "Your guess is way too high... Guess again." if guess.to_i > (SECRET_NUMBER + 5)
  return "Your guess is too high... Guess again." if guess.to_i > SECRET_NUMBER
  return "Your guess is way too low... Guess again." if guess.to_i < (SECRET_NUMBER - 5)
  return "Your guess is too low... Guess again." if guess.to_i < SECRET_NUMBER
  return "Congratulations!  You guessed the correct number.\nThe secret number is #{SECRET_NUMBER}." if guess.to_i == SECRET_NUMBER
end

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER,
                          :message => message}
end
