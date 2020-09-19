import 'models/user.dart';

class UserHolder {
  Map<String, User> users = {};

  User registerUser(String name, String phone, String email) {
    User user = User(name: name, phone: phone, email: email);

    if (users.containsKey(user.login)) {
      throw Exception('User is already registered');
    }

    users[user.login] = user;

    return user;
  }

  User registerUserByPhone(String name, String phone) =>
      registerUser(name, phone, "");

  User registerUserByEmail(String name, String email) =>
      registerUser(name, "", email);

  User getUserByLogin(String login) {
    return users.containsKey(login) ? users[login] : null;
  }

  void setFriends(String login, List<User> friends) {
    User user = getUserByLogin(login);

    if (user == null) {
      throw Exception('User is not found');
    }

    user.addFriends(friends);
  }

  User findUserInFriends(String login, User userToFind) {
    User user = getUserByLogin(login);

    if (!user.friends.contains(userToFind)) {
      throw Exception('This friend is not found for the user');
    }

    return user.friends[user.friends.indexOf(userToFind)];
  }

  List<User> importUsers(List<String> csvUsers) {
    List<User> importedUsers = [];
    csvUsers.forEach((String csvUser) {
      List<String> userData = csvUser.split(';');
      importedUsers.add(registerUser(userData[0].trim(), userData[2].trim(), userData[1].trim()));
    });

    return importedUsers;
  }
}
