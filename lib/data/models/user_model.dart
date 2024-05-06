import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String username;
  final String password;
  final String lastname;
  final String email;
  final String imageUrl;
  final String phoneNumber;
  final String userId;
  final String fcm;
  final String authUid;

  UserModel({
    required this.username,
    required this.lastname,
    required this.password,
    required this.userId,
    required this.imageUrl,
    required this.phoneNumber,
    required this.email,
    required this.fcm,
    required this.authUid,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'] as String? ?? '',
      lastname: json['lastname'] as String? ?? '',
      password: json['password'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      email: json['email'] as String? ?? '',
      fcm: json["fcm"] as String? ?? '',
      authUid: json["authUid"] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'lastname': lastname,
      'password': password,
      'userId': userId,
      'imageUrl': imageUrl,
      'phoneNumber': phoneNumber,
      'email': email,
      "fcm": fcm,
      "authUid": authUid,
    };
  }


  Map<String, dynamic> toJsonForUpdate() {
    return {
      'username': username,
      'lastname': lastname,
      'password': password,
      'imageUrl': imageUrl,
      'phoneNumber': phoneNumber,
      'email': email,
      "fcm": fcm,
      "authUid": authUid,
    };
  }

  UserModel copyWith({
    String? username,
    String? lastname,
    String? password,
    String? userId,
    String? imageUrl,
    String? phoneNumber,
    String? email,
    String? fcm,
    String? authUid,
  }) {
    return UserModel(
      username: username ?? this.username,
      lastname: lastname ?? this.lastname,
      password: password ?? this.password,
      userId: userId ?? this.userId,
      imageUrl: imageUrl ?? this.imageUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      fcm: fcm ?? this.fcm,
      authUid: authUid ?? this.authUid,
    );
  }

  static UserModel initial() => UserModel(
        username: '',
        lastname: '',
        password: '',
        userId: '',
        imageUrl: '',
        phoneNumber: '',
        email: '',
        fcm: '',
        authUid: '',
      );
}
