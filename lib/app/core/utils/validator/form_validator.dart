class FormValidator {


  // First Name / Last Name Validation
  static String? validateName(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName enter korun';
    }
    if (value.trim().length < 2) {
      return '$fieldName minimum 2 character hote hobe';
    }
    return null;
  }

  // Email Validation
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email address enter korun';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Sothik email address enter korun';
    }
    return null;
  }

  // Address Validation
  static String? validateAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Address enter korun';
    }
    return null;
  }

  // Password Validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password enter korun';
    }
    if (value.length < 6) {
      return 'Password minimum 6 character hote hobe';
    }
    return null;
  }

  // Confirm Password Validation (পাসওয়ার্ড মিলছে কি না চেক করার জন্য)
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Confirm password enter korun';
    }
    if (value != password) {
      return 'Password and Confirm Password mile nai';
    }
    return null;
  }
}