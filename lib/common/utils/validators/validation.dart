class ValidationResult {
  final bool isValid;
  final String message;

  ValidationResult(this.isValid, this.message);
}

// VALIDATION CLASS
mixin AppValidator {
  static ValidationResult validateField({
    String? email,
    String? password,
    String? confirmPassword,
    String? mobile,
    String? otp,
    bool checkStrongPassword = false,
    String? username,
    String? enteredCaptcha,
    String? generatedCaptcha, // Pass the generated captcha
  }) {
    if (username != null && username.trim().isEmpty) {
      return ValidationResult(false, "Username cannot be empty");
    }

    if (email != null && !_validateEmail(email)) {
      return ValidationResult(false, "Invalid email address");
    }

    if (password != null) {
      if (password.isEmpty) {
        return ValidationResult(false, "Password cannot be empty");
      }
      if (checkStrongPassword && !_isStrongPassword(password)) {
        return ValidationResult(false,
            "Password must be at least 8 characters, include uppercase, lowercase, number & special character");
      }
    }

    if (enteredCaptcha != null && generatedCaptcha != null) {
      if (enteredCaptcha.trim().isEmpty) {
        return ValidationResult(false, "Captcha cannot be empty");
      }
      if (enteredCaptcha.trim() != generatedCaptcha.trim()) {
        return ValidationResult(false, "Captcha does not match");
      }
    }

    if (confirmPassword != null && password != confirmPassword) {
      return ValidationResult(false, "Passwords do not match");
    }

    if (mobile != null && !_validateMobile(mobile)) {
      return ValidationResult(false, "Invalid mobile number");
    }

    if (otp != null && otp.length != 6) {
      return ValidationResult(false, "OTP must be 6 digits");
    }

    return ValidationResult(true, "Validation successful");
  }

  static bool _validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(email);
  }

  static bool _validateMobile(String mobile) {
    return RegExp(r'^[0-9]{10}$').hasMatch(mobile);
  }

  static bool _isStrongPassword(String password) {
    return RegExp(
            r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
        .hasMatch(password);
  }
}
