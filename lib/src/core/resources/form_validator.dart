class FormValidator {
  /// empty text validation
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required.';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    // reguler expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    // check for minimum password length
    if (value.length < 6) {
      return 'Password must at least 6 character long';
    }

    // check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one Uppercase letter.';
    }

    // check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.';
    }
    return null;
  }

  // check for password not same
  bool isPasswordNotSame(String password, String confirmPassword) {
    return password != confirmPassword;
  }

  // check for password confirm
  bool isCurrentPasswordSame(String currentPassword, String newPassword) {
    return currentPassword == newPassword;
  }

  // check for NIK length
  bool isNikMatchLength(String? value) {
    return value!.length == 16;
  }

  // validator phone number length
  bool isPhoneNumberMatchLength(String? value) {
    return value!.length == 12;
  }
}
