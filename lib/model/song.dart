import 'package:flutter/material.dart';
// import 'dart:ui' as ui;

class Song {
  String? id;
  String? title;
  List<Image>? image;
  String? album;
  String? url;
  String? type;
  String? description;
  String? primaryArtists;
  String? singers;
  String? language;
  Color? background;

  Song(
      {this.id,
      this.title,
      this.image,
      this.album,
      this.url,
      this.type,
      this.description,
      this.primaryArtists,
      this.singers,
      this.language,
      this.background});

  Song.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['image'] != null) {
      image = <Image>[];
      json['image'].forEach((v) {
        image!.add(new Image.fromJson(v));
      });
    }
    album = json['album'];
    url = json['url'];
    type = json['type'];
    description = json['description'];
    primaryArtists = json['primaryArtists'];
    singers = json['singers'];
    language = json['language'];
    background:
    Colors.white;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.image != null) {
      data['image'] = this.image!.map((v) => v.toJson()).toList();
    }
    data['album'] = this.album;
    data['url'] = this.url;
    data['type'] = this.type;
    data['description'] = this.description;
    data['primaryArtists'] = this.primaryArtists;
    data['singers'] = this.singers;
    data['language'] = this.language;
    return data;
  }
}

class Image {
  String? quality;
  String? url;

  Image({this.quality, this.url});

  Image.fromJson(Map<String, dynamic> json) {
    quality = json['quality'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quality'] = this.quality;
    data['url'] = this.url;
    return data;
  }
}
