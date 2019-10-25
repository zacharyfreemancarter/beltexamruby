class PlaylistsController < ApplicationController
    before_action :authorization
    def create
        Playlist.create(user_id: params[:id], song_id: params[:song_id])
        redirect_to '/songs'
    end
    private
    def authorization
        if params[:id] != current_user.id.to_s
            redirect_to '/songs'
        end
    end
end
