class WellnessModel {
  final String name;
  final String desc;
  final int price;
  final int? disc;
  final String image;

  WellnessModel({
    this.disc = 0,
    required this.desc,
    required this.price,
    required this.name,
    required this.image,
  });
}
