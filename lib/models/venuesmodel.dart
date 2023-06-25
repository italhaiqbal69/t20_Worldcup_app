class VenuesModel {
  String country;
  String city;
  String stadium;
  String image;

  VenuesModel({
    required this.country,
    required this.city,
    required this.stadium,
    required this.image,
  });

  static VenuesModel fromjson(Map<String, dynamic> map) {
    return VenuesModel(
      country: map['country'],
      city: map['city'],
      stadium: map['stadium'],
      image: map['image'],
    );
  }
}
