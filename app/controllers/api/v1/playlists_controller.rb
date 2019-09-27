class Api::V1::PlaylistsController < ApplicationController
    before_action :find_playlist, only: [:show]
    
    def index
        @playlists = Playlist.all
        render json: @playlists
    end

    def show
        render json: @playlist
    end

    def create
        @playlist = Playlist.create(playlist_params)
        if @playlist.valid?
            render json: @playlist
        else
            render json: {message: @playlist.errors.full_messages}
        end
    end

    private

    def find_playlist
        @playlist = Playlist.find(params[:id])
    end

    def playlist_params
        params.permit(:title, :user_id)
    end
end
