require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
  end

  def score
    @result = {}
    file_path = "https://wagon-dictionary.herokuapp.com/#{params[:proposition]}"
    serialized_word = open(file_path).read
    my_word_characteristic = JSON.parse(serialized_word)
    my_word_is_english = my_word_characteristic["found"]

    params[:proposition].upcase.split("").each do |letter|
      if params[:letters].split("").include?(letter)
        params[:letters].split("").delete_at(params[:letters].split("").find_index(letter))
      else
        @result = {
          score: 0,
          message: "This word :#{attempt} is not in the grid"
        }
        session[:total_score].nil? ? session[:total_score] = @result[:score] : session[:total_score] += @result[:score]
        return @result
      end
    end
    if my_word_is_english
       @result = {
        score: params[:proposition].size,
        message: "This word: #{params[:proposition]} is good, well done",
      }
      session[:total_score].nil? ? session[:total_score] = @result[:score] : session[:total_score] += @result[:score]
      return @result
    else
      @result = {
        score: 0,
        message: "This word: #{params[:proposition]} is not an english word"
      }
      session[:total_score].nil? ? session[:total_score] = @result[:score] : session[:total_score] += @result[:score]
      return @result
    end
  end
end
