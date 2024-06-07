class Player {
  String? title;
  String? description;
  String? audioUrl;
  String? imageUrl;

  Player({
    this.title,
    this.description,
    this.audioUrl,
    this.imageUrl,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      title: json['title'],
      description: json['description'],
      audioUrl: json['audio_url'],
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'audio_url': audioUrl,
      'image_url': imageUrl,
    };
  }
}
