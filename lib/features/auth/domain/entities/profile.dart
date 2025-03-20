class Profile {
  final String id;
  final String? updatedAt;
  final String username;
  final String fullName;
  final String country;
  final String accountType;
  final String? avatarUrl;
  final String email;

  Profile({
    required this.id,
    this.updatedAt,
    required this.username,
    required this.fullName,
    required this.country,
    required this.accountType,
    this.avatarUrl,
    required this.email,
  });
}
