class WrongNumberOfPlayersError < StandardError ; end

class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2

  player_one = game[0]
  player_two = game[1]

  raise NoSuchStrategyError unless valid_strategy?(player_one[1]) && valid_strategy?(player_two[1])

  player_one[1].upcase!
  player_two[1].upcase!

  determine_winner(player_one, player_two)
end

def valid_strategy?(strategy)
  return false if strategy.nil?

  ['S', 'P', 'R'].include? strategy.upcase
end

def determine_winner(player_one, player_two)
  return player_one if player_one[1] == player_two[1]
  first_move_wins?(player_one[1], player_two[1]) ? player_one : player_two
end

def first_move_wins?(one, two)
  (one == 'R' && two == 'S') || (one == 'S' && two == 'P') || (one == 'P' && two == 'R')
end

def find_tournament_winner(tournament)
  if is_a_single_game?(tournament)
    puts "single game: #{tournament.inspect}"
    return rps_game_winner(tournament)
  end

  puts "not a single game. about to call rps_game_winner for each winner on #{tournament.inspect}"
  winners = tournament
  until winners.size == 1
    winners = winners.map { |game| rps_game_winner(game) }
    puts "winners = #{winners.inspect}"
  end
  

  winner = find_tournament_winner(winners)
  puts "winner = #{winner.inspect}"
end

def is_a_single_game?(tournament)
  tournament.size == 2 && (tournament.first.class != Array || tournament.first.first.class != Array)
end

def rps_tournament_winner(tournaments)
  tournament_winners = tournaments.map { |tournament| find_tournament_winner(tournament) } unless is_a_single_game?(tournaments)

  find_tournament_winner(tournament_winners || tournaments)
end

a = [ [
  [ ["A", "P"], ["B", "S"] ],
  [ ["C", "R"], ["D", "S"] ],
  [ ["E", "R"], ["F", "S"] ],
  [ ["G", "R"], ["H", "S"] ],
  [ ["I", "R"], ["J", "S"] ],
  [ ["K", "R"], ["L", "S"] ],
  [ ["M", "R"], ["N", "S"] ],
  [ ["O", "R"], ["P", "S"] ]
],
[
  [ ["A2", "P"], ["B2", "S"] ],
  [ ["C2", "R"], ["D2", "S"] ],
  [ ["E2", "R"], ["F2", "S"] ],
  [ ["G2", "R"], ["H2", "S"] ],
  [ ["I2", "R"], ["J2", "S"] ],
  [ ["K2", "R"], ["L2", "S"] ],
  [ ["M2", "R"], ["N2", "S"] ],
  [ ["O2", "R"], ["P2", "S"] ]
]
]

puts rps_tournament_winner(a)
