import 'package:the_phantom_fx/features/auth/domain/entities/profile.dart';

class UserModel extends Profile {
  UserModel({
    required super.id,
    required super.username,
    required super.fullName,
    required super.country,
    required super.accountType,
    required super.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      username: map['username'] ?? '',
      fullName: map['fullName'] ?? '',
      country: map['country'] ?? '',
      accountType: map['accountType'] ?? '',
      email: map['email'] ?? '',
    );
  }
}
