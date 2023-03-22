import 'package:flutter/cupertino.dart';

class User extends ChangeNotifier {

  String name;
  String email;
  String phone;

  // Constructor
  User({

    required this.name,
    required this.email,
    required this.phone,

  });
  void updateAccount(input) {
    User user;
    user = input;
    notifyListeners();
  }
  User copy({

    String? name,
    String? phone,
    String? email,

  }) =>
      User(

        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,

      );

  static User fromJson(Map<String, dynamic> json) => User(

        name: json['name'],
        email: json['email'],
        phone: json['phone'],
      );

  Map<String, dynamic> toJson() => {

        'name': name,
        'email': email,
        'phone': phone,
      };
}
