import 'package:flutter/cupertino.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  final Widget tablet;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1200;
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  const Responsive(
      {Key key,
      @required this.mobile,
      @required this.desktop,
      @required this.tablet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1200) {
        return desktop;
      } else if (constraints.maxWidth >= 800) {
        return tablet;
      } else
        return mobile;
    });
  }
}
