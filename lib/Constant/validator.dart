import 'package:easy_localization/easy_localization.dart';

class Validator {
  String? noValidate({required String value}) {
    return null;
  }

  String? validateEmpty({required String value, String? message}) {
    if (value.trim().isEmpty) {
      return message ?? 'Fill Field'.tr();
    }
    return null;
  }

  String? validatePassword({required String value, String? message}) {
    if (value.trim().isEmpty) {
      return message ?? "Fill Field".tr();
    } else if (value.length < 6) {
      return message ?? "password should be above 6 character".tr();
    }
    // else if (!RegExp(
    //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&^*~]).{8,}$')
    //     .hasMatch(value)) {
    //   print(message);
    //   return message ?? "passValidation";
    // }
    return null;
  }

  String? validateEmail({required String value, String? message}) {
    if (value.trim().isEmpty) {
      return message ?? "Fill Field".tr();
    }
    //  else if (!RegExp(
    //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
    //     .hasMatch(value)) {
    //   return message ?? tr("mailValidation");
    // }
    return null;
  }

  String? validateNum({required String value, String? message}) {
    if (value.trim().isEmpty) {
      return message ?? "Fill Field".tr();
    } else if (!RegExp(r'(^[1-9]\d*(\.\d+)?$)').hasMatch(value) ||
        value.length == 13) {
      return message ?? "Number Invalied".tr();
    }
    return null;
  }

  String? validateAmount({required String value, String? message}) {
    if (value.trim().isEmpty) {
      return message ?? "Fill Field".tr();
    } else if (!RegExp(r'(^[1-9]\d*(\.\d+)?$)').hasMatch(value) ||
        value.isEmpty ||
        double.tryParse(value) == 0) {
      return message ?? "Number Invalied".tr();
    }
    return null;
  }

  String? validatePlateNum({required String value, String? message}) {
    if (value.trim().isEmpty) {
      return message ?? "Fill Field".tr();
    } else if (!RegExp(r'(^[1-9]\d*(\.\d+)?$)').hasMatch(value) ||
        value.length == 1) {
      return message ?? "Number Invalied".tr();
    }
    return null;
  }

  String? validatePlatechar({required String value, String? message}) {
    if (value.trim().isEmpty) {
      return message ?? "Fill Field".tr();
    } else if (!RegExp(r'(/^[a-zA-Z0-9 +(),-]+$/)').hasMatch(value) ||
        value.length == 1) {
      return message ?? "Charchter Invalied".tr();
    }
    return null;
  }

  String? validatePhone({required String value, String? message}) {
    if (value.trim().isEmpty) {
      return message ?? "Fill Field".tr();
    } else if (!RegExp(
                r'(^\+[0-9]{2}|^\+[0-9]{2}\(0\)|^\(\+[0-9]{2}\)\(0\)|^00[0-9]{2}|^0)([0-9]{9}$|[0-9\-\s]{10}$)')
            .hasMatch(value) ||
        value.length > 11 ||
        value.length < 11) {
      return message ?? "Phone Validation".tr();
    }
    return null;
  }

  String? validatePasswordConfirm(
      {required String confirm, required String pass, String? message}) {
    if (confirm.trim().isEmpty) {
      return message ?? "Fill Field".tr();
    } else if (confirm != pass) {
      return message ?? "Confirm Validation".tr();
    }
    return null;
  }

  String? validateCode({required String code, String? message}) {
    if (code.trim().isEmpty) {
      return message ?? "Fill Field".tr();
    } else if (code.length < 4) {
      return message ?? "Code Validation".tr();
    }
    return null;
  }
}
