import '../string_util.dart';

enum LoginType { phone, email }

class User {
  String email;
  String phone;

  String _firstName;
  String _lastName;
  LoginType _type;

  List<User> friends = [];

  User._({String firstName, String lastName, String email, String phone}) {
    _firstName = firstName;
    _lastName = lastName;
    this.phone = phone;
    this.email = email;
    _type = email != null ? LoginType.email : LoginType.phone;
  }

  factory User({String name, String email, String phone}) {
    email = email == null ? '' : email;
    phone = phone == null ? '' : phone;
    if (name.isEmpty) throw Exception('User name is empty');
    if (phone.isEmpty && email.isEmpty)
      throw Exception('Phone and email are empty');

    return User._(
        firstName: _getFirstName(name),
        lastName: _getLastName(name),
        phone: phone.isEmpty ? phone : checkPhone(phone),
        email: email.isEmpty ? email : checkEmail(email));
  }

  static String _getFirstName(String name) => name.split(' ')[0];
  static String _getLastName(String name) => name.split(' ')[1];

  static String checkPhone(String phone) {
    String pattern = r"^([?:+0])?[0-9]{11}";

    phone = phone.replaceAll(RegExp("[^+\\d]"), "");

    if (phone == null || phone.isEmpty) {
      throw Exception('Don\'t enter empty phone number');
    } else if (!RegExp(pattern).hasMatch(phone)) {
      throw Exception(
          'Enter a valid phone number starting with a + and containing 11 digits');
    }

    return phone;
  }

  static String checkEmail(String email) {
    String pattern =
        r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$';

    email = email.replaceAll(RegExp("\t\n"), "");

    if (email == null || email.isEmpty) {
      throw Exception('Don\t enter empty email');
    } else if (!RegExp(pattern).hasMatch(email)) {
      throw Exception('Email has invalid format');
    }

    return email;
  }

  String get login {
    return _type == LoginType.email ? email : phone;
  }

  String get name {
    return "".capitalize(_firstName) + " " + "".capitalize(_lastName);
  }

  void addFriends(List<User> users) {
    friends.addAll(users);
  }

  void removeFriend(User friend) {
    friends.remove(friend);
  }

  @override
  bool operator ==(Object object) {
    if (object == null) {
      return null;
    }

    if (object is User) {
      return _firstName == object._firstName &&
          _lastName == object._lastName &&
          email == object.email &&
          phone == object.phone;
    }

    return false;
  }
}
