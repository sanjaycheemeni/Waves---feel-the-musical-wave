import 'dart:convert';

class SongSearch {
  final String id;
  final String name;
  final String type;
  final String year;
  final int duration;
  final String label;
  final int playCount;
  final String language;
  final bool hasLyrics;
  final String url;
  final Album album;
  final Artists artists;
  final List<DownloadUrl> image;
  final List<DownloadUrl> downloadUrl;

  SongSearch({
    required this.id,
    required this.name,
    required this.type,
    required this.year,
    required this.duration,
    required this.label,
    required this.playCount,
    required this.language,
    required this.hasLyrics,
    required this.url,
    required this.album,
    required this.artists,
    required this.image,
    required this.downloadUrl,
  });

  factory SongSearch.fromJson(Map<String, dynamic> json) {
    return SongSearch(
      id: json['id'],
      name: json['name'].toString(),
      type: json['type'].toString(),
      year: json['year'],
      duration: json['duration'],
      label: json['label'].toString(),
      playCount: json['playCount'],
      language: json['language'].toString(),
      hasLyrics: json['hasLyrics'],
      url: json['url'],
      album: Album.fromJson(json['album']),
      artists: Artists.fromJson(json['artists']),
      image: List<DownloadUrl>.from(
          json['image'].map((x) => DownloadUrl.fromJson(x))),
      downloadUrl: List<DownloadUrl>.from(
          json['downloadUrl'].map((x) => DownloadUrl.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'year': year,
      'duration': duration,
      'label': label,
      'playCount': playCount,
      'language': language,
      'hasLyrics': hasLyrics,
      'url': url,
      'album': album.toJson(),
      'artists': artists.toJson(),
      'image': image.map((x) => x.toJson()).toList(),
      'downloadUrl': downloadUrl.map((x) => x.toJson()).toList(),
    };
  }
}

class Album {
  final String id;
  final String name;
  final String url;

  Album({
    required this.id,
    required this.name,
    required this.url,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      name: json['name'].toString(),
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'url': url,
    };
  }
}

class Artists {
  final List<All> primary;
  final List<All> featured;
  final List<All> all;

  Artists({
    required this.primary,
    required this.featured,
    required this.all,
  });

  factory Artists.fromJson(Map<String, dynamic> json) {
    return Artists(
      primary: List<All>.from(json['primary'].map((x) => All.fromJson(x))),
      featured: List<All>.from(json['featured'].map((x) => All.fromJson(x))),
      all: List<All>.from(json['all'].map((x) => All.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'primary': primary.map((x) => x.toJson()).toList(),
      'featured': featured.map((x) => x.toJson()).toList(),
      'all': all.map((x) => x.toJson()).toList(),
    };
  }
}

class All {
  final String id;
  final String name;
  final String role;
  final List<DownloadUrl> image;
  final String type;
  final String url;

  All({
    required this.id,
    required this.name,
    required this.role,
    required this.image,
    required this.type,
    required this.url,
  });

  factory All.fromJson(Map<String, dynamic> json) {
    return All(
      id: json['id'],
      name: json['name'],
      role: json['role'].toString(),
      image: List<DownloadUrl>.from(
          json['image'].map((x) => DownloadUrl.fromJson(x))),
      type: json['type'].toString(),
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'image': image.map((x) => x.toJson()).toList(),
      'type': type,
      'url': url,
    };
  }
}

class DownloadUrl {
  final String quality;
  final String url;

  DownloadUrl({
    required this.quality,
    required this.url,
  });

  factory DownloadUrl.fromJson(Map<String, dynamic> json) {
    return DownloadUrl(
      quality: json['quality'].toString(),
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quality': quality,
      'url': url,
    };
  }
}
