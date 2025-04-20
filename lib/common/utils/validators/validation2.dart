// to use it go to your screen and add this class

mixin AppValidator {
  String? emailValidator(String? value, {bool checkEmpty = true}) {
    if (!checkEmpty && _isEmpty(value)) {
      return null;
    }
    if (_isEmpty(value)) {
      return 'Please enter your email';
    }
    var emailValidPattern = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!emailValidPattern.hasMatch(value!)) {
      return 'Please enter valid email';
    }

    return null;
  }

  String? gstValidator(String? value, {bool optional = false}) {
    if (value == null || value.trim().isEmpty) {
      if (optional) {
        return null;
      }
      return 'Please enter GST number';
    }

    String pattern =
        r'^([0][1-9]|[1-2][0-9]|[3][0-7])([a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}[1-9a-zA-Z]{1}[zZ]{1}[0-9a-zA-Z]{1})+$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value.trim())) {
      return 'GST number is not valid';
    }

    return null;
  }

  String? dlValidator(String? value, {bool optional = false}) {
    if ((value == null || value.trim().isEmpty)) {
      if (optional) {
        return null;
      }
      return 'Please enter Driving licence';
    }

    String pattern = r'^[A-Z]{2}[0-9]{2}(19|20)?[0-9]{2}[0-9]{7}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value.trim())) {
      return 'Driving licence is not valid';
    }

    return null;
  }

  String? panValidator(String? value, {bool optional = false}) {
    if (value == null || value.trim().isEmpty) {
      if (optional) {
        return null;
      }
      return 'Please enter PAN';
    }

    String pattern = r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value.trim())) {
      return 'PAN is not valid';
    }

    return null;
  }

  String? passportValidator(String? value, {bool optional = false}) {
    if (value == null || value.trim().isEmpty) {
      if (optional) {
        return null;
      }
      return 'Please enter Passport';
    }

    String pattern = r'^[A-Z]{1}[0-9]{7}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value.trim())) {
      return 'Passport is not valid';
    }

    return null;
  }

  String? mobileValidator(String? value, {bool returnEmptyString = false}) {
    if (value == null || value.trim().isEmpty) {
      if (returnEmptyString) {
        return '';
      }
      return 'Please enter mobile number';
    }

    String pattern = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value.trim())) {
      if (returnEmptyString) {
        return '';
      }
      return 'Please enter valid number';
    }

    return null;
  }

  String? passwordValidator(String? value) {
    if (_isEmpty(value)) {
      return 'Please enter password';
    }
    return null;
  }

  String? strongPasswordValidator(String? value) {
    if (_isEmpty(value)) {
      return '*Minimum 8 characters, with a combination of upper and\n  lower case letters, characters and numbers.';
    }

    if (value!.length < 8) {
      return '*Minimum 8 characters';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return '*At least one uppercase letter';
    }

    if (!value.contains(RegExp(r'[a-z]'))) {
      return '*At least one lowercase letter';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return '*At least one digit';
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return '*At least one special character';
    }
    return null;
  }

  String? confirmPasswordValidator(
      {String? password, String? confirmPassword}) {
    if (_isEmpty(confirmPassword)) {
      return '*Minimum 8 characters, with a combination of upper and\n  lower case letters, characters and numbers.';
    }

    if (confirmPassword!.length < 8) {
      return '*Minimum 8 characters';
    }

    if (!confirmPassword.contains(RegExp(r'[A-Z]'))) {
      return '*At least one uppercase letter';
    }

    if (!confirmPassword.contains(RegExp(r'[a-z]'))) {
      return '*At least one lowercase letter';
    }

    if (!confirmPassword.contains(RegExp(r'[0-9]'))) {
      return '*At least one digit';
    }

    if (!confirmPassword.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return '*At least one special character';
    }
    if (!_isEqual(password ?? '', confirmPassword)) {
      return 'Password is not same';
    }
    return null;
  }

  String? emptyValidator(String? value,
      {String? title, bool returnEmptyString = false}) {
    if (value == null || value.trim().isEmpty) {
      if (returnEmptyString) {
        return '';
      }
      return 'Please enter ${title ?? ''}';
    }
    return null;
  }

  String? captchaValidator(
      {String? userInput,
      required String generatedCaptcha,
      bool returnEmptyString = false}) {
    if (userInput == null || userInput.trim().isEmpty) {
      return returnEmptyString ? '' : 'Please enter the CAPTCHA';
    }
    if (userInput.trim() != generatedCaptcha.trim()) {
      return 'Incorrect CAPTCHA, please try again';
    }
    return null;
  }

  String? otpValidator(String? value, {int length = 6}) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter OTP';
    }
    if (value.length != length) {
      return 'OTP must be $length digits long';
    }
    return null;
  }


  String? amountValidator(String? value, {String? title}) {
    // Check if the field is empty
    if (value == null || value.trim().isEmpty) {
      return 'Please enter ${title ?? ''}';
    }

    // Try to parse the value as a number
    final num? amount = num.tryParse(value.trim());

    // Check if the parsing was successful and if the amount is greater than zero
    if (amount == null || amount <= 0) {
      return '${title ?? 'Amount'} must be greater than zero';
    }

    return null;
  }

  String? confirmAccountNumberValidator(
      String? value, String? originalAccountNumber,
      {bool returnEmptyString = false}) {
    if (value == null || value.trim().isEmpty) {
      if (returnEmptyString) {
        return '';
      }
      return 'Please confirm account number';
    } else if (value != originalAccountNumber) {
      return 'Account numbers do not match';
    }
    return null;
  }

  bool _isEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return true;
    }
    return false;
  }

  bool _isEqual(String value1, String value2) {
    return value1 == value2;
  }
}
