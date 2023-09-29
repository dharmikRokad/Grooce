class Category {
  final String? name;
  final String? img;

  Category({
    required this.name,
    required this.img,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"] ?? '',
        img: json["img"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "img": img,
      };
}
