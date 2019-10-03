class Api::V1::PlaylistsController < ApplicationController
    before_action :find_playlist, only: [:show, :destroy]
    
    def index
        @playlists = Playlist.all
        render json: @playlists
    end

    def show
        render json: @playlist
    end

    def create
        @playlist = Playlist.create(playlist_params)

        @tracks = params[:tracks]

        @tracks.each do |track_id|
            PlaylistSong.create(playlist_id: @playlist.id , track_id: track_id)
        end
        
        if @playlist.valid?
            render json: @playlist
        else
            render json: {message: @playlist.errors.full_messages}
        end
    end

    def destroy
        @playlist.destroy
        render json: {message: "This was delted!"}
    end

    private

    def find_playlist
        @playlist = Playlist.find(params[:id])
    end

    def playlist_params
        params.permit(:title, :user_id)
    end
end
