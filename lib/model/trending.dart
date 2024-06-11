class Trending {
  String? id;
  String? name;
  String? desc; // Changed from description to desc
  String? image; // Changed type from List<Image> to String
  String? type;
  String? language;

  Trending({
    this.id,
    this.name,
    this.desc,
    this.image,
    this.type,
    this.language,
  });

  factory Trending.fromJson(Map<String, dynamic> json) {
    return Trending(
      id: json['id'],
      name: json['title'],
      desc: json['desc'],
      image: json['image'],
      type: json['type'],
      language: json['language'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['image'] = this.image;
    data['type'] = this.type;
    data['language'] = this.language;
    return data;
  }
}
