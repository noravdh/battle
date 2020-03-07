require 'sinatra/base'
require_relative 'lib/player.rb'
require_relative 'lib/game.rb'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    @game = Game.create(player_1, player_2)
    redirect '/characters'
  end

  get '/characters' do
    @game = Game.instance
    erb :characters
  end 

  post '/selected' do
    @game = Game.instance
    @game.player_1.choose_character(params[:character_1])
    @game.player_2.choose_character(params[:character_2])
    redirect '/play'
  end

  get '/play' do
    @game = Game.instance
    erb :play
  end

  post '/attack' do
    @game = Game.instance
    @game.attack(@game.current_turn, params[:name])
    if @game.game_over?
      redirect '/game-over'
    else
      redirect '/attack'
    end
  end

  get '/attack' do
    @game = Game.instance
    # @game.attack(@game.opponent_of(@game.current_turn, move))
    erb :attack
  end

  post '/switch-turns' do
    @game = Game.instance
    @game.switch_turns
    redirect('/play')
  end

  get '/game-over' do
    @game = Game.instance
    erb :game_over
  end

  run! if app_file == $0
end