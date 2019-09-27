## Here we are fetching from the Spotify API songs we want to have
## First value is the userid from a playlist
## Second value is the playlsitid of the playlist
s_tracks = RSpotify::Playlist.find("odvwn9zdm1v47f4dcbkhb5otn","70hW2ncwTpGJ9HvvNzekGp").tracks

# Here we are saving that data to out database
# This is going to be what we make playlists out of
tracks = s_tracks.map do |s_track|
    Track.create_from_spotify_track(s_track)
end


t = User.create(name: "Taryn", description: "Blue castello pecorino bavarian bergkase. Monterey jack danish fontina red leicester st. agur blue cheese cut the cheese emmental camembert de normandie when the cheese comes out everybody's happy.", password: 'abc')

m = User.create(name: "Mia", description: "Goat cream cheese say cheese ricotta babybel port-salut cow stinking bishop. Camembert de normandie when the cheese comes out everybody's happy melted cheese.", password: 'abc')

j = User.create(name: "John", description: "Halloumi halloumi mascarpone. Smelly cheese mozzarella rubber cheese fondue cheesy grin caerphilly dolcelatte croque monsieur. Chalk and cheese gouda brie cheesy grin stilton paneer cheesy feet fondue.", password: 'abc')

p1 = Playlist.create(user: t, title: "Mix vol. 1")
p2 = Playlist.create(user: m, title: "Another One")
p3 = Playlist.create(user: j, title: "Some Other Mix")

20.times do
    PlaylistSong.create(
        playlist: Playlist.all.sample,
        track: Track.all.sample
    )
end

User.all.each do |user| 
    Playlist.all.each do |playlist|
        Vote.create(
            user: user,
            playlist: playlist,
            upvote: false
        )
    end
end
