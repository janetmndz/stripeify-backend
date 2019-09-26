class Api::V1::TracksController < ApplicationController
    def index
        @tracks = Track.all
        render json: @tracks
    end

    def emo_songs
        s_tracks = RSpotify::Playlist.find("21sy5jqxtfyautnknkvbxqj3i","3lweNvb8EyS27siZi0rn8h").tracks
        @tracks = s_tracks.map do |s_track|
            Track.new_from_spotify_track(s_track)
        end

        render json: @tracks
    end
end
