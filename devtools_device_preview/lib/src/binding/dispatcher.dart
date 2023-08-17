import 'dart:isolate';
import 'dart:typed_data';
import 'dart:ui' as ui;

class PreviewDispatcher implements ui.PlatformDispatcher {
  PreviewDispatcher(this.parent);
  final ui.PlatformDispatcher parent;

  @override
  ui.VoidCallback? get onAccessibilityFeaturesChanged =>
      parent.onAccessibilityFeaturesChanged;

  @override
  set onAccessibilityFeaturesChanged(ui.VoidCallback? callback) {
    parent.onAccessibilityFeaturesChanged = callback;
  }

  @override
  ui.FrameCallback? get onBeginFrame => parent.onBeginFrame;

  @override
  set onBeginFrame(ui.FrameCallback? callback) =>
      parent.onBeginFrame = callback;

  @override
  ui.VoidCallback? get onDrawFrame => parent.onDrawFrame;

  @override
  set onDrawFrame(ui.VoidCallback? callback) => parent.onDrawFrame = callback;

  @override
  ui.ErrorCallback? onError;

  @override
  ui.VoidCallback? onFrameDataChanged;

  @override
  ui.KeyDataCallback? onKeyData;

  @override
  ui.VoidCallback? get onLocaleChanged => parent.onLocaleChanged;

  @override
  set onLocaleChanged(ui.VoidCallback? callback) =>
      parent.onLocaleChanged = callback;

  @override
  ui.VoidCallback? get onMetricsChanged => parent.onMetricsChanged;

  @override
  set onMetricsChanged(ui.VoidCallback? value) =>
      parent.onMetricsChanged = value;

  @override
  ui.VoidCallback? get onPlatformBrightnessChanged =>
      parent.onPlatformBrightnessChanged;

  @override
  set onPlatformBrightnessChanged(ui.VoidCallback? value) =>
      parent.onPlatformBrightnessChanged = value;

  @override
  ui.VoidCallback? onPlatformConfigurationChanged;

  @override
  ui.PlatformMessageCallback? get onPlatformMessage => parent.onPlatformMessage;

  @override
  set onPlatformMessage(ui.PlatformMessageCallback? value) =>
      parent.onPlatformMessage = value;

  @override
  ui.PointerDataPacketCallback? get onPointerDataPacket =>
      parent.onPointerDataPacket;

  @override
  set onPointerDataPacket(ui.PointerDataPacketCallback? value) =>
      parent.onPointerDataPacket = value;

  @override
  ui.TimingsCallback? get onReportTimings => parent.onReportTimings;

  @override
  set onReportTimings(ui.TimingsCallback? value) =>
      parent.onReportTimings = value;

  @override
  ui.VoidCallback? get onSemanticsEnabledChanged =>
      parent.onSemanticsEnabledChanged;

  @override
  set onSemanticsEnabledChanged(ui.VoidCallback? value) =>
      parent.onSemanticsEnabledChanged = value;

  @override
  ui.VoidCallback? onSystemFontFamilyChanged;

  @override
  ui.VoidCallback? get onTextScaleFactorChanged =>
      parent.onTextScaleFactorChanged;

  @override
  set onTextScaleFactorChanged(ui.VoidCallback? value) =>
      parent.onTextScaleFactorChanged = value;

  ui.AccessibilityFeatures? _previewAccessibilityFeatures;

  @override
  ui.AccessibilityFeatures get accessibilityFeatures =>
      _previewAccessibilityFeatures ?? parent.accessibilityFeatures;

  set accessibilityFeatures(ui.AccessibilityFeatures value) {
    _previewAccessibilityFeatures = value;
    onAccessibilityFeaturesChanged?.call();
  }

  bool? _previewAlwaysUse24HourFormat;

  @override
  bool get alwaysUse24HourFormat =>
      _previewAlwaysUse24HourFormat ?? parent.alwaysUse24HourFormat;

  set alwaysUse24HourFormat(bool? value) {
    _previewAlwaysUse24HourFormat = value;
    onMetricsChanged?.call();
  }

  @override
  bool get brieflyShowPassword => parent.brieflyShowPassword;

  @override
  ui.Locale? computePlatformResolvedLocale(List<ui.Locale> supportedLocales) {
    return parent.computePlatformResolvedLocale(supportedLocales);
  }

  @override
  String get defaultRouteName => parent.defaultRouteName;

  @override
  ui.FrameData get frameData => parent.frameData;

  @override
  ByteData? getPersistentIsolateData() {
    return parent.getPersistentIsolateData();
  }

  @override
  ui.FlutterView? get implicitView => parent.implicitView;

  @override
  String get initialLifecycleState => parent.initialLifecycleState;

  ui.Locale? _previewLocale;

  @override
  ui.Locale get locale => _previewLocale ?? parent.locale;

  set locale(ui.Locale? value) {
    _previewLocale = value;
    onLocaleChanged?.call();
  }

  List<ui.Locale>? _previewLocales;

  @override
  List<ui.Locale> get locales => _previewLocales ?? parent.locales;

  set locales(List<ui.Locale> value) {
    _previewLocales = value;
    onLocaleChanged?.call();
  }

  @override
  bool get nativeSpellCheckServiceDefined =>
      parent.nativeSpellCheckServiceDefined;

  ui.Brightness? _previewBrightness;

  @override
  ui.Brightness get platformBrightness =>
      _previewBrightness ?? parent.platformBrightness;

  set platformBrightness(ui.Brightness? value) {
    _previewBrightness = value;
    onPlatformBrightnessChanged?.call();
  }

  @override
  void registerBackgroundIsolate(ui.RootIsolateToken token) {
    return parent.registerBackgroundIsolate(token);
  }

  @override
  void requestDartPerformanceMode(ui.DartPerformanceMode mode) {
    return parent.requestDartPerformanceMode(mode);
  }

  @override
  void scheduleFrame() {
    parent.scheduleFrame();
  }

  @override
  bool get semanticsEnabled => parent.semanticsEnabled;

  @override
  void sendPlatformMessage(String name, ByteData? data,
      ui.PlatformMessageResponseCallback? callback) {
    parent.sendPlatformMessage(name, data, callback);
  }

  @override
  void sendPortPlatformMessage(
      String name, ByteData? data, int identifier, SendPort port) {
    return parent.sendPortPlatformMessage(name, data, identifier, port);
  }

  @override
  void setIsolateDebugName(String name) {
    parent.setIsolateDebugName(name);
  }

  @override
  String? get systemFontFamily => parent.systemFontFamily;

  double? _previewTextScaleFactor;

  @override
  double get textScaleFactor =>
      _previewTextScaleFactor ?? parent.textScaleFactor;

  set textScaleFactor(double? value) {
    _previewTextScaleFactor = value;
    onMetricsChanged?.call();
  }

  @override
  void updateSemantics(ui.SemanticsUpdate update) {
    return parent.updateSemantics(update);
  }

  @override
  Iterable<ui.FlutterView> get views => parent.views;

  @override
  ui.SemanticsActionEventCallback? get onSemanticsActionEvent =>
      _previewSemanticsActionEventCallback ?? parent.onSemanticsActionEvent;

  @override
  Iterable<ui.Display> get displays => parent.displays;

  @override
  ui.FlutterView? view({required int id}) => parent.view(id: id);

  ui.SemanticsActionEventCallback? _previewSemanticsActionEventCallback;

  @override
  set onSemanticsActionEvent(ui.SemanticsActionEventCallback? callback) {
    _previewSemanticsActionEventCallback = callback;
  }
}
