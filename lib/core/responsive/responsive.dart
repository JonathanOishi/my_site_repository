import 'package:flutter/material.dart';

import 'break_points.dart';
import 'device_type.dart';

class Responsive {
  Responsive._();

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static bool isMobile(BuildContext context) {
    return width(context) < AppBreakpoints.mobile;
  }

  static bool isTablet(BuildContext context) {
    return width(context) >= AppBreakpoints.mobile &&
        width(context) < AppBreakpoints.tablet;
  }

  static bool isDesktop(BuildContext context) {
    return width(context) >= AppBreakpoints.tablet;
  }

  static bool isMobileOrTablet(BuildContext context) {
    return isMobile(context) || isTablet(context);
  }

  static bool isTabletOrDesktop(BuildContext context) {
    return isTablet(context) || isDesktop(context);
  }

  static DeviceType deviceType(BuildContext context) {
    final screenWidth = width(context);

    if (screenWidth < AppBreakpoints.mobile) {
      return DeviceType.mobile;
    }

    if (screenWidth < AppBreakpoints.tablet) {
      return DeviceType.tablet;
    }

    return DeviceType.desktop;
  }

  static T responsive<T>({
    required BuildContext context,
    required T mobile,
    required T tablet,
    required T desktop,
  }) {
    switch (deviceType(context)) {
      case DeviceType.mobile:
        return mobile;

      case DeviceType.tablet:
        return tablet;

      case DeviceType.desktop:
        return desktop;
    }
  }
}
