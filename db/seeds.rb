## Here we are fetching from the Spotify API songs we want to have
## First value is the userid from a playlist
## Second value is the playlsitid of the playlist
s_tracks = RSpotify::Playlist.find("odvwn9zdm1v47f4dcbkhb5otn","70hW2ncwTpGJ9HvvNzekGp").tracks

# Here we are saving that data to out database
# This is going to be what we make playlists out of
tracks = s_tracks.map do |s_track|
    Track.create_from_spotify_track(s_track)
end