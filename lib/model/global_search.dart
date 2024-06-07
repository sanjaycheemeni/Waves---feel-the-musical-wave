// To parse this JSON data, do
//
//     final globalSearch = globalSearchFromMap(jsonString);

import 'dart:convert';

List<GlobalSearch> globalSearchFromMap(String str) => List<GlobalSearch>.from(json.decode(str).map((x) => GlobalSearch.fromMap(x)));

String globalSearchToMap(List<GlobalSearch> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class GlobalSearch {
    bool success;
    Data data;

    GlobalSearch({
        required this.success,
        required this.data,
    });

    factory GlobalSearch.fromMap(Map<String, dynamic> json) => GlobalSearch(
        success: json["success"],
        data: Data.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "data": data.toMap(),
    };
}

class Data {
    Artists topQuery;
    Songs songs;
    Albums albums;
    Artists artists;
    Playlists playlists;

    Data({
        required this.topQuery,
        required this.songs,
        required this.albums,
        required this.artists,
        required this.playlists,
    });

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        topQuery: Artists.fromMap(json["topQuery"]),
        songs: Songs.fromMap(json["songs"]),
        albums: Albums.fromMap(json["albums"]),
        artists: Artists.fromMap(json["artists"]),
        playlists: Playlists.fromMap(json["playlists"]),
    );

    Map<String, dynamic> toMap() => {
        "topQuery": topQuery.toMap(),
        "songs": songs.toMap(),
        "albums": albums.toMap(),
        "artists": artists.toMap(),
        "playlists": playlists.toMap(),
    };
}

class Albums {
    List<AlbumsResult> results;
    int position;

    Albums({
        required this.results,
        required this.position,
    });

    factory Albums.fromMap(Map<String, dynamic> json) => Albums(
        results: List<AlbumsResult>.from(json["results"].map((x) => AlbumsResult.fromMap(x))),
        position: json["position"],
    );

    Map<String, dynamic> toMap() => {
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
        "position": position,
    };
}

class AlbumsResult {
    String id;
    String title;
    List<Image> image;
    String artist;
    String url;
    String type;
    String description;
    String year;
    String songIds;
    String language;

    AlbumsResult({
        required this.id,
        required this.title,
        required this.image,
        required this.artist,
        required this.url,
        required this.type,
        required this.description,
        required this.year,
        required this.songIds,
        required this.language,
    });

    factory AlbumsResult.fromMap(Map<String, dynamic> json) => AlbumsResult(
        id: json["id"],
        title: json["title"],
        image: List<Image>.from(json["image"].map((x) => Image.fromMap(x))),
        artist: json["artist"],
        url: json["url"],
        type: json["type"],
        description: json["description"],
        year: json["year"],
        songIds: json["songIds"],
        language: json["language"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "image": List<dynamic>.from(image.map((x) => x.toMap())),
        "artist": artist,
        "url": url,
        "type": type,
        "description": description,
        "year": year,
        "songIds": songIds,
        "language": language,
    };
}

class Image {
    Quality quality;
    String url;

    Image({
        required this.quality,
        required this.url,
    });

    factory Image.fromMap(Map<String, dynamic> json) => Image(
        quality: qualityValues.map[json["quality"]]!,
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "quality": qualityValues.reverse[quality],
        "url": url,
    };
}

enum Quality {
    THE_150_X150,
    THE_500_X500,
    THE_50_X50
}

final qualityValues = EnumValues({
    "150x150": Quality.THE_150_X150,
    "500x500": Quality.THE_500_X500,
    "50x50": Quality.THE_50_X50
});

class Artists {
    List<ArtistsResult> results;
    int position;

    Artists({
        required this.results,
        required this.position,
    });

    factory Artists.fromMap(Map<String, dynamic> json) => Artists(
        results: List<ArtistsResult>.from(json["results"].map((x) => ArtistsResult.fromMap(x))),
        position: json["position"],
    );

    Map<String, dynamic> toMap() => {
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
        "position": position,
    };
}

class ArtistsResult {
    String id;
    String title;
    List<Image> image;
    String type;
    String description;
    int? position;

    ArtistsResult({
        required this.id,
        required this.title,
        required this.image,
        required this.type,
        required this.description,
        this.position,
    });

    factory ArtistsResult.fromMap(Map<String, dynamic> json) => ArtistsResult(
        id: json["id"],
        title: json["title"],
        image: List<Image>.from(json["image"].map((x) => Image.fromMap(x))),
        type: json["type"],
        description: json["description"],
        position: json["position"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "image": List<dynamic>.from(image.map((x) => x.toMap())),
        "type": type,
        "description": description,
        "position": position,
    };
}

class Playlists {
    List<PlaylistsResult> results;
    int position;

    Playlists({
        required this.results,
        required this.position,
    });

    factory Playlists.fromMap(Map<String, dynamic> json) => Playlists(
        results: List<PlaylistsResult>.from(json["results"].map((x) => PlaylistsResult.fromMap(x))),
        position: json["position"],
    );

    Map<String, dynamic> toMap() => {
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
        "position": position,
    };
}

class PlaylistsResult {
    String id;
    String title;
    List<Image> image;
    String url;
    String type;
    String language;
    String description;

    PlaylistsResult({
        required this.id,
        required this.title,
        required this.image,
        required this.url,
        required this.type,
        required this.language,
        required this.description,
    });

    factory PlaylistsResult.fromMap(Map<String, dynamic> json) => PlaylistsResult(
        id: json["id"],
        title: json["title"],
        image: List<Image>.from(json["image"].map((x) => Image.fromMap(x))),
        url: json["url"],
        type: json["type"],
        language: json["language"],
        description: json["description"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "image": List<dynamic>.from(image.map((x) => x.toMap())),
        "url": url,
        "type": type,
        "language": language,
        "description": description,
    };
}

class Songs {
    List<SongsResult> results;
    int position;

    Songs({
        required this.results,
        required this.position,
    });

    factory Songs.fromMap(Map<String, dynamic> json) => Songs(
        results: List<SongsResult>.from(json["results"].map((x) => SongsResult.fromMap(x))),
        position: json["position"],
    );

    Map<String, dynamic> toMap() => {
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
        "position": position,
    };
}

class SongsResult {
    String id;
    String title;
    List<Image> image;
    String album;
    String url;
    String type;
    String description;
    String primaryArtists;
    String singers;
    String language;

    SongsResult({
        required this.id,
        required this.title,
        required this.image,
        required this.album,
        required this.url,
        required this.type,
        required this.description,
        required this.primaryArtists,
        required this.singers,
        required this.language,
    });

    factory SongsResult.fromMap(Map<String, dynamic> json) => SongsResult(
        id: json["id"],
        title: json["title"],
        image: List<Image>.from(json["image"].map((x) => Image.fromMap(x))),
        album: json["album"],
        url: json["url"],
        type: json["type"],
        description: json["description"],
        primaryArtists: json["primaryArtists"],
        singers: json["singers"],
        language: json["language"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "image": List<dynamic>.from(image.map((x) => x.toMap())),
        "album": album,
        "url": url,
        "type": type,
        "description": description,
        "primaryArtists": primaryArtists,
        "singers": singers,
        "language": language,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
