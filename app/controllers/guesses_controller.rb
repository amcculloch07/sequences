class GuessesController < ApplicationController
  def index

    g = Guess.new
    g.first_num = params["first_number"]
    g.second_num = params["second_number"]
    g.third_num = params["third_number"]

    @first = params["first_number"].to_i
    @second = params["second_number"].to_i
    @third = params["third_number"].to_i



    if g.first_num != nil && g.second_num != nil && g.third_num != nil
      if @third > @second && @second > @first
        @result = "Yes!"
      else
        @result = "No"
      end
      g.result = @result
      g.save
    end

    @list = Guess.all

    render ("guesses/index.html.erb")
  end

  def answer
    # params = ["q"=>"Increasing numbers"]
    @user_answer = params["q"]
    render ("guesses/answer.html.erb")
  end

  def clear
    Guess.delete_all
    render ("guesses/index.html.erb")
  end
end
