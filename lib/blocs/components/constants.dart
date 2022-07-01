import 'package:flutter/material.dart';
import 'package:self_love/blocs/components/size_config.dart';


const kPrimaryColor = Color(0xFF2FBD0E);
const kBackgroundColor = Color(0xFFFAFFFA);
const kPrimaryLightColor = Color(0xFFC9C9C9);
const kTextColor = Color(0xFF000000);
const kTextBaseColor =  Color(0xFF828181);
const kPrimaryGradiantColor = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [  Color(0xFF8ECB74), Color(0xFFFFFFFF)],
);

const kAnimationDuration = Duration(milliseconds: 200);
const kSpacingUnit = 10;
// Form Error

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenHeight(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
