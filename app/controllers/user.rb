get '/' do
  erb :login
end

get '/error_login' do
  @user_message = "Usuario incorrecto"
  erb :login
end

post '/play' do
  if User.find_by(email: params[:email], password: params[:password]) != nil
    erb :play_maraton
  else
    redirect to ('/error_login')
  end
end

post '/play/deck' do
  if params[:arte] == "Arte"
    @deck = Deck.find_by(name: "Arte").cards
  elsif params[:geografia] == "Geografia"
    @deck = Deck.find_by(name: "Geografia").cards
  elsif params[:deportes] == "Deportes"
    @deck = Deck.find_by(name: "Deportes").cards
  end
  erb :play_deck
end


