// user_model.dart
class UserModel {
  final String id;
  final String email;

  UserModel({required this.id, required this.email});

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
  };
}
