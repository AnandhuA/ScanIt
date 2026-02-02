import 'package:flutter/widgets.dart';

class MQ {
  MQ._(); // private constructor

  static double maxHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double maxWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double height(BuildContext context, double percent) =>
      maxHeight(context) * (percent / 100);

  static double width(BuildContext context, double percent) =>
      maxWidth(context) * (percent / 100);

  static EdgeInsets padding(BuildContext context) =>
      MediaQuery.of(context).padding;

  static double topPadding(BuildContext context) =>
      MediaQuery.of(context).padding.top;

  static double bottomPadding(BuildContext context) =>
      MediaQuery.of(context).padding.bottom;
}