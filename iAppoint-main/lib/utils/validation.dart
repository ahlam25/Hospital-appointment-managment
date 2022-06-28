class Validator {
  static password(String? txt) {
    if (txt == null || txt.isEmpty) {
      return "Invalid password!";
    }
    if (txt.length < 5) {
      return "Password must has 8 characters";
    }
    if (!txt.contains(RegExp(r'[A-Z]'))) {
      return "Password must has uppercase";
    }
    if (!txt.contains(RegExp(r'[0-9]'))) {
      return "Password must has digits";
    }
    if (!txt.contains(RegExp(r'[a-z]'))) {
      return "Password must has lowercase";
    }
    if (!txt.contains(RegExp(r'[#?!@$%^&*-]'))) {
      return "Password must has special characters";
    } else {
      return;
    }
  }
}
