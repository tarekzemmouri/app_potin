require 'bundler'
Bundler.require
require 'gossip'

class ApplicationController < Sinatra::Base
    
    get '/' do
       erb :index, locals: {gossips: Gossip.all}
    end

    get '/gossips/new' do
        erb :gossips_new
    end

    post '/gossips/new' do
        Gossip.new(params["gossip_author"], params["gossip_content"] ).save
        redirect '/'
        end

    get '/gossips/:id' do
        "Salut l'auteur du potin est #{params[gossip_author]} et il a dis sur lui que #{params[gossip_content]}"
    end
    

    #run! if app_file == $0 permet d’exécuter le code de la classe sans avoir à écrire un ApplicationController.new.perform en bas du fichier
end
