class Dish {
  final String name;
  final String desc;
  final String image;

  Dish({
    required this.name,
    required this.desc,
    required this.image,
  });

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      name: json['name'] as String,
      desc: json['desc'] as String,
      image: json['image'] as String,
    );
  }
}
