class WrongNumberOfPlayersError < StandardError ; end
    class NoSuchStrategyError < StandardError ; end 
    
    
    def rps_game_winner(game)
        raise WrongNumberOfPlayersError unless game.length ==2
        raise NoSuchStrategyError unless game[0][1] =~ /R|P|S/ and game[1][1] =~ /R|P|S/
        
        rules = {"R" => "S", "S"=>"P", "P" => "R"}
        
        if rules[game[1][1]] == game[0][1]
            game[1]
        else
            game[0]
        end 
    end
    
    #test for rps_game_winner
    p rps_game_winner([["Armando", "P"], ["Dave", "S"]])
    p rps_game_winner([["Armando", "R"], ["Dave", "S"]])
    p rps_game_winner([["Armando", "S"], ["Dave", "S"]])
    # p rps_game_winner([["Armando", "R"]])
    
def rps_tournament_winner(tournament)
    if tournament[0][0].class == String 
       return rps_game_winner(tournament)        
    else
        winners = []
        winners << rps_tournament_winner(tournament[0])
        winners << rps_tournament_winner(tournament[1])
        rps_tournament_winner(winners)
    end
end

puts rps_tournament_winner [
    [
        [ ["Richard", "R"],  ["Michael", "S"] ],
        [ ["Armando", "P"], ["Dave", "S"] ]
    ],
    [ 
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
]