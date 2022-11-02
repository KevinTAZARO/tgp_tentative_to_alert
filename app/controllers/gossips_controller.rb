class GossipsController < ApplicationController

    def index
        @gossips = Gossip.all
    end

    def show
        @gossip = Gossip.find(params[:id])
    end

    def new
        @gossips = Gossip.new
    end

    def create
        @gossips = Gossip.new(title: params[:title], content: params[:content], user_id: rand(1..10))
        if @gossips.save # essaie de sauvegarder en base gossip
            # si ça marche, il redirige vers la page d'index du site
            puts "GG well save"
            redirect_to gossips_path
          else
            # sinon, il render la view new (qui est celle sur laquelle on est déjà)
            puts "Try again"
            render "new"
        end
    end

    def update
        @gossips = Gossip.find(params[:id])
        gossip_user = @gossips.user

        if @gossip.update(gossip_params)
            redirect_to gossip_path
          else
            render :edit_gossip_path
        end
    end

    def destroy
        @gossips = Gossip.find(params[:id])
        gossip_user = @gossips.user
    
        if current_user == gossip_user
          @gossip.destroy
          redirect_to gossip_path
        else
          puts "Can't destroy bruh"
        end
    end

end
