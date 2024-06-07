class Audio {
  String? id;
  String? name;
  String? type;
  String? year;
  String? releaseDate;
  int? duration;
  String? label;
  bool? explicitContent;
  int? playCount;
  String? language;
  bool? hasLyrics;
  dynamic lyricsId; // Changed to dynamic
  String? url;
  String? copyright;
  Album? album;
  Artists? artists;
  List<Image>? image;
  List<DownloadUrl>? downloadUrl;

  Audio({
    this.id,
    this.name,
    this.type,
    this.year,
    this.releaseDate,
    this.duration,
    this.label,
    this.explicitContent,
    this.playCount,
    this.language,
    this.hasLyrics,
    this.lyricsId,
    this.url,
    this.copyright,
    this.album,
    this.artists,
    this.image,
    this.downloadUrl,
  });

  factory Audio.fromJson(Map<String, dynamic> json) {
    return Audio(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      year: json['year'],
      releaseDate: json['releaseDate'],
      duration: json['duration'],
      label: json['label'],
      explicitContent: json['explicitContent'],
      playCount: json['playCount'],
      language: json['language'],
      hasLyrics: json['hasLyrics'],
      lyricsId: json['lyricsId'],
      url: json['url'],
      copyright: json['copyright'],
      album: json['album'] != null ? Album.fromJson(json['album']) : null,
      artists:
          json['artists'] != null ? Artists.fromJson(json['artists']) : null,
      image: json['image'] != null
          ? List<Image>.from(json['image'].map((v) => Image.fromJson(v)))
          : null,
      downloadUrl: json['downloadUrl'] != null
          ? List<DownloadUrl>.from(
              json['downloadUrl'].map((v) => DownloadUrl.fromJson(v)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['year'] = year;
    data['releaseDate'] = releaseDate;
    data['duration'] = duration;
    data['label'] = label;
    data['explicitContent'] = explicitContent;
    data['playCount'] = playCount;
    data['language'] = language;
    data['hasLyrics'] = hasLyrics;
    data['lyricsId'] = lyricsId;
    data['url'] = url;
    data['copyright'] = copyright;
    if (album != null) {
      data['album'] = album!.toJson();
    }
    if (artists != null) {
      data['artists'] = artists!.toJson();
    }
    if (image != null) {
      data['image'] = image!.map((v) => v.toJson()).toList();
    }
    if (downloadUrl != null) {
      data['downloadUrl'] = downloadUrl!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Album {
  String? id;
  String? name;
  String? url;

  Album({this.id, this.name, this.url});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Artists {
  List<Primary>? primary;
  List<dynamic>? featured; // Changed to dynamic
  List<All>? all;

  Artists({this.primary, this.featured, this.all});

  factory Artists.fromJson(Map<String, dynamic> json) {
    return Artists(
      primary: json['primary'] != null
          ? List<Primary>.from(json['primary'].map((v) => Primary.fromJson(v)))
          : null,
      featured: json['featured'] != null
          ? List<dynamic>.from(json['featured'])
          : null,
      all: json['all'] != null
          ? List<All>.from(json['all'].map((v) => All.fromJson(v)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (primary != null) {
      data['primary'] = primary!.map((v) => v.toJson()).toList();
    }
    if (featured != null) {
      data['featured'] = featured;
    }
    if (all != null) {
      data['all'] = all!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Primary {
  String? id;
  String? name;
  String? role;
  List<Image>? image;
  String? type;
  String? url;

  Primary({this.id, this.name, this.role, this.image, this.type, this.url});

  factory Primary.fromJson(Map<String, dynamic> json) {
    return Primary(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      image: json['image'] != null
          ? List<Image>.from(json['image'].map((v) => Image.fromJson(v)))
          : null,
      type: json['type'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['role'] = role;
    if (image != null) {
      data['image'] = image!.map((v) => v.toJson()).toList();
    }
    data['type'] = type;
    data['url'] = url;
    return data;
  }
}

class Image {
  String? quality;
  String? url;

  Image({this.quality, this.url});

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      quality: json['quality'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['quality'] = quality;
    data['url'] = url;
    return data;
  }
}

class DownloadUrl {
  String? quality;
  String? url;

  DownloadUrl({this.quality, this.url});

  factory DownloadUrl.fromJson(Map<String, dynamic> json) {
    return DownloadUrl(
      quality: json['quality'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['quality'] = quality;
    data['url'] = url;
    return data;
  }
}

class All {
  String? id;
  String? name;
  String? role;
  List<Image>? image;
  String? type;
  String? url;

  All({this.id, this.name, this.role, this.image, this.type, this.url});

  factory All.fromJson(Map<String, dynamic> json) {
    return All(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      image: json['image'] != null
          ? List<Image>.from(json['image'].map((v) => Image.fromJson(v)))
          : null,
      type: json['type'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['role'] = role;
    if (image != null) {
      data['image'] = image!.map((v) => v.toJson()).toList();
    }
    data['type'] = type;
    data['url'] = url;
    return data;
  }
}
