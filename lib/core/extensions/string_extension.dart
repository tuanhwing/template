
import 'package:easy_localization/easy_localization.dart';

extension StringExtension on String {

  static const needleRegex = r'{#}';
  static const needle = '{#}';
  static final RegExp exp = new RegExp(needleRegex);

  ///is integer value
  bool isInt() {
    bool result = false;
    try {
      int temp = int.tryParse(this);
      result = temp != null;
    }
    catch(_) {}
    return result;
  }

  static bool isNullOrEmpty(String string) {
    return string == null || string.isEmpty;
  }

  bool isValidEmail() {
    if (this.trim().isEmpty) return false;
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
  }

  bool isValidPhoneNumber() {
    if (this.trim().isEmpty) return false;
    Pattern pattern =
        r'^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4,5}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(this);
  }

  bool isValidPassword() {
    if (this.trim().isEmpty) return false;
    RegExp regex =
    RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@%^&*-]).{8,}");
    return regex.hasMatch(this);
  }

  bool isValidTaxCode() {
    if (this.trim().isEmpty) return false;
    RegExp regex = RegExp(r"^[0-9]{10}(?:[-][0-9]{3})?$");
    return regex.hasMatch(this);
  }

  ///Convert timestamp to DateString
  ///this = number of seconds
  String convertDateString({String dateformatString = 'dd-MM-yyyy – hh:mm:ss'}) {
    int time = int.tryParse(this);
    if (time == null) return null;

    DateTime date = DateTime.fromMillisecondsSinceEpoch(time * 1000);

    return DateFormat(dateformatString).format(date);
  }

  ///format an interploated String
  static String interpolate(String string, List l) {
    Iterable<RegExpMatch> matches = exp.allMatches(string);

    assert(l.length == matches.length);

    var i = -1;
    return string.replaceAllMapped(exp, (match) {
      i = i + 1;
      return '${l[i]}';
    });
  }

  ///Upcase function
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach => this.split(" ").map((str) => str.inCaps).join(" ");
// String capitalize() {
//   return "${this[0].toUpperCase()}${this.substring(1)}";
// }
}