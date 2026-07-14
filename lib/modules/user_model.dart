

class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String website;
  final String company;
  final String address;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.website,
    required this.company,
    required this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      website: json["website"],
      company: json["company"]["name"],
      address:
      "${json["address"]["street"]}, ${json["address"]["city"]}",
    );
  }
}