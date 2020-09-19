extension MyString on String {
  String capitalize(String title) => title[0].toUpperCase() + title.substring(1).toLowerCase();
}