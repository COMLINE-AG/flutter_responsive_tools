part of responsive_tools;

/// SizeTools is used to retrieve information about the current screen size (width, height, orientation, etc.)
/// It also offers values for consistent padding (standardPadding, halfPadding, quarterPadding)
class SizeTools {
  final double _standardPaddingPercent = 0.03;

  static SizeTools? _instance;
  static double? _systemTextScaleFactor;
  static double? _screenWidth;
  static double? _screenHeight;
  static Orientation? _orientation;
  static late double _statusBarHeight;
  static late double _bottomBarHeight;

  SizeTools._();

  factory SizeTools() {
    assert(_instance != null, '\SizeTools have not been initialized\n');
    return _instance!;
  }

  /// SizeTools need to be initialized in your main() method. Example:
  ///
  /// void main() {
  ///   runApp(MyApp());
  /// }
  ///
  /// class MyApp extends StatelessWidget {
  ///   @override
  ///   Widget build(BuildContext context) {
  ///     return LayoutBuilder(
  ///       builder: (_, BoxConstraints constraints) {
  ///         SizeTools.init(constraints);
  ///         return ...
  ///       },
  ///     );
  ///   }
  /// }
  static void init(BoxConstraints constraints) {
    if (_instance == null) {
      _instance = SizeTools._();
    }

    _screenWidth = constraints.maxWidth;
    _screenHeight = constraints.maxHeight;
    _orientation = _screenWidth! > _screenHeight! ? Orientation.landscape : Orientation.portrait;

    var window = WidgetsBinding.instance?.window ?? ui.window;
    _statusBarHeight = window.padding.top;
    _bottomBarHeight = window.padding.bottom;
    _systemTextScaleFactor = window.textScaleFactor;
  }

  double? get width => _screenWidth;
  double? get height => _screenHeight;
  Orientation? get orientation => _orientation;
  double get effectiveHeight => _screenHeight! - _statusBarHeight - _bottomBarHeight;
  double? get smallestDimension => _screenWidth! > _screenHeight! ? _screenHeight : _screenWidth;
  double get standardPadding => smallestDimension! * _standardPaddingPercent;
  double get standardPadding2x => standardPadding * 2;
  double get halfPadding => standardPadding / 2;
  double get quarterPadding => standardPadding / 4;

  double widthPercent(double percent) => _screenWidth! * percent;
  double heightPercent(double percent) => _screenHeight! * percent;

  double adjustFontSize(double fontSize) {
    double scaleFactor = min(_screenWidth! / 1000.0, _screenHeight! / 1000.0);
    double adjustedFontSize = fontSize * scaleFactor;
    if (_systemTextScaleFactor != null) {
      adjustedFontSize = adjustedFontSize * _systemTextScaleFactor!;
    }
    return adjustedFontSize;
  }
}