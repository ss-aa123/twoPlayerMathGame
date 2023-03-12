class Game
  attr_accessor :player1, :player2, :currentPlayer

  def initialize()
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @current_player = @player1
  end

  # start round
  def start_game
    while @player1.player_alive && player2.player_alive
      # start new round
      puts "----- NEW TURN -----"
      ask_question
    end

    puts "----- GAME OVER -----"
    puts (@player1.wins > player2.wins ? "#{@player1.name} wins with a score of #{@player1.wins} and #{@player1.lives} lives remaining" : "#{@player2.name} wins with a score of #{@player2.wins} and #{@player2.lives} lives remaining")
    puts "Good bye!"

  end
  
  # generate new question
  def ask_question
    # variables
    question = Question.new
    answer = question.answer
    game_prompt = "#{@current_player.name}, #{question.output}"
    
    # ask the question
    puts game_prompt
    
    # user input
    player_answer = gets.chomp.to_i
    
    # check answer
    if check_answer(player_answer, answer) # if true
      puts "YES! You are correct."

      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
      switch_players
    else # if wrong
      puts "Seriously? No."
      
      @current_player.lose_life

      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
      switch_players
    end
  end
    
  # check answer
  def check_answer(player_answer, answer)
    player_answer == answer ? true : false
  end
  
  # switch current player
  def switch_players
    @current_player == @player1 ? (@current_player = @player2) : (@current_player = @player1)
  end

end