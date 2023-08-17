import 'dart:ui' as ui;
import 'package:devtools_device_preview/src/binding/dispatcher.dart';
import 'package:flutter/rendering.dart';

class Preview implements ui.FlutterView {
  @override
  List<ui.DisplayFeature> get displayFeatures => parent.displayFeatures;

  Preview(this.parent, this.previewDispatcher);
  final ui.FlutterView parent;

  final PreviewDispatcher previewDispatcher;

  double? _previewDevicePixelRatio;

  @override
  double get devicePixelRatio =>
      _previewDevicePixelRatio ?? parent.devicePixelRatio;

  set devicePixelRatio(double? value) {
    _previewDevicePixelRatio = value;
    previewDispatcher.onMetricsChanged?.call();
  }

  ui.ViewPadding? _previewPadding;

  @override
  ui.ViewPadding get padding => _previewPadding ?? parent.padding;

  set padding(ui.ViewPadding? value) {
    _previewPadding = value;
    previewDispatcher.onMetricsChanged?.call();
  }

  ui.Rect? _previewPhysicalGeometry;

  @override
  ui.Rect get physicalGeometry =>
      _previewPhysicalGeometry ?? parent.physicalGeometry;

  set physicalGeometry(ui.Rect? value) {
    _previewPhysicalGeometry = value;
    previewDispatcher.onMetricsChanged?.call();
  }

  ui.Size? _previewPhysicalSize;

  @override
  ui.Size get physicalSize => _previewPhysicalSize ?? parent.physicalSize;

  set physicalSize(ui.Size? value) {
    _previewPhysicalSize = value;
    previewDispatcher.onMetricsChanged?.call();
  }

  @override
  ui.PlatformDispatcher get platformDispatcher => parent.platformDispatcher;

  @override
  void render(ui.Scene scene) {
    parent.render(scene);
  }

  @override
  ui.ViewPadding get systemGestureInsets => parent.systemGestureInsets;

  @override
  void updateSemantics(ui.SemanticsUpdate update) =>
      parent.updateSemantics(update);

  @override
  ui.ViewPadding get viewInsets => parent.viewInsets;

  ui.ViewPadding? _previewViewPadding;

  @override
  ui.ViewPadding get viewPadding => _previewViewPadding ?? parent.viewPadding;

  set viewPadding(ui.ViewPadding? value) {
    _previewViewPadding = value;
    previewDispatcher.onMetricsChanged?.call();
  }

  @override
  ui.GestureSettings get gestureSettings => parent.gestureSettings;

  @override
  ui.Display get display => parent.display;

  @override
  int get viewId => parent.viewId;
}

class PreviewWindowPadding implements ui.ViewPadding {
  const PreviewWindowPadding({
    required this.left,
    required this.top,
    required this.right,
    required this.bottom,
  });

  factory PreviewWindowPadding.fromEdgeInsets(EdgeInsets insets) =>
      PreviewWindowPadding(
        left: insets.left,
        top: insets.top,
        right: insets.right,
        bottom: insets.bottom,
      );

  const PreviewWindowPadding.all(double value)
      : left = value,
        right = value,
        top = value,
        bottom = value;

  /// The distance from the left edge to the first unpadded pixel, in physical pixels.
  @override
  final double left;

  /// The distance from the top edge to the first unpadded pixel, in physical pixels.
  @override
  final double top;

  /// The distance from the right edge to the first unpadded pixel, in physical pixels.
  @override
  final double right;

  /// The distance from the bottom edge to the first unpadded pixel, in physical pixels.
  @override
  final double bottom;

  /// Converts this window padding to a [EdgeInsets] object.
  EdgeInsets asEdgeInsets() => EdgeInsets.only(
        left: left,
        right: right,
        top: top,
        bottom: bottom,
      );

  @override
  String toString() {
    return 'WindowPadding(left: $left, top: $top, right: $right, bottom: $bottom)';
  }
}

class PreviewAccessibilityFeatures implements AccessibilityFeatures {
  PreviewAccessibilityFeatures({
    required this.accessibleNavigation,
    required this.boldText,
    required this.disableAnimations,
    required this.highContrast,
    required this.invertColors,
    required this.reduceMotion,
    required this.onOffSwitchLabels,
  });

  factory PreviewAccessibilityFeatures.merge(
    ui.AccessibilityFeatures other, {
    bool? accessibleNavigation,
    bool? boldText,
    bool? disableAnimations,
    bool? highContrast,
    bool? invertColors,
    bool? reduceMotion,
    bool? onOffSwitchLabels,
  }) =>
      PreviewAccessibilityFeatures(
        accessibleNavigation:
            accessibleNavigation ?? other.accessibleNavigation,
        boldText: boldText ?? other.boldText,
        disableAnimations: disableAnimations ?? other.disableAnimations,
        highContrast: highContrast ?? other.highContrast,
        invertColors: invertColors ?? other.invertColors,
        reduceMotion: reduceMotion ?? other.reduceMotion,
        onOffSwitchLabels: onOffSwitchLabels ?? other.onOffSwitchLabels,
      );

  @override
  final bool accessibleNavigation;

  @override
  final bool boldText;

  @override
  final bool disableAnimations;

  @override
  final bool highContrast;

  @override
  final bool invertColors;

  @override
  final bool reduceMotion;

  @override
  final bool onOffSwitchLabels;
}
