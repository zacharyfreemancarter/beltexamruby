class SongsController < ApplicationController
    before_action :authorization, only: [:create]
    def index
        @songs = Song.order(id: :desc)
    end
    def create
        @song = Song.new(song_params)
        @song.user = User.find(params[:id])
        @song.save
        flash[:errors] = @song.errors.messages
        redirect_to "/songs"
    end
    def show
        @song = Song.find(params[:song_id])
    end
    private
    def song_params
        params.require(:song).permit(:title, :artist)
    end
    def authorization
        if params[:id] != current_user.id.to_s
            redirect_to '/songs'
        end
    end
end
