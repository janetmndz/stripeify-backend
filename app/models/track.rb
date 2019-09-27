class Track < ApplicationRecord


    ## This will make a new track but not save it to our database
    def self.new_from_spotify_track(spotify_track)
        Track.new(
            spotify_id: spotify_track.id,
            name: spotify_track.name,
            artist: spotify_track.artists[0].name,
            preview: spotify_track.preview_url,
            external_url: spotify_track.external_urls["spotify"]
        )
    end

    ## This is will make and save a track to our database
    def self.create_from_spotify_track(spotify_track)
        track = self.new_from_spotify_track(spotify_track)
        track.save
        track
    end

end
