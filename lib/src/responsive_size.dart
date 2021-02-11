part of responsive_tools;

class ResponsiveSize {
  static ResponsiveSize _instance;
  static double _pixelRatio;
  static double _systemTextScaleFactor;
  static double _screenWidth;
  static double _screenHeight;
  static double _statusBarHeight;
  static double _bottomBarHeight;

  ResponsiveSize._();

  factory ResponsiveSize() {
    assert(_instance != null, '\nScreenSize not initialized\n');
    return _instance;
  }

  static void init(BoxConstraints constraints) {
    if (_instance == null) {
      _instance = ResponsiveSize._();
    }

    _screenWidth = constraints.maxWidth;
    _screenHeight = constraints.maxHeight;

    var mediaQuery = WidgetsBinding.instance.window;
    _pixelRatio = mediaQuery.devicePixelRatio;
    _statusBarHeight = mediaQuery.padding.top;
    _bottomBarHeight = mediaQuery.padding.bottom;
    _systemTextScaleFactor = mediaQuery.textScaleFactor;
  }

  double get width => _screenWidth;
  double get height => _screenHeight;
  double get smallestDimension => _screenWidth > _screenHeight ? _screenHeight : _screenWidth;
  double get standardPadding => smallestDimension * 0.03;
  double get standardPadding2x => standardPadding * 2;
  double get halfPadding => smallestDimension * 0.015;
  double get quarterPadding => smallestDimension * 0.0075;

  double widthPercent(double percent) => _screenWidth * percent;
  double heightPercent(double percent) => _screenHeight * percent;

  double fontSize(double fontSize) {
    double scaleFactor = min(_screenWidth / 1000.0, _screenHeight / 1000.0);
    double adjustedFontSize = fontSize * scaleFactor;
    if (_systemTextScaleFactor != null) {
      adjustedFontSize = adjustedFontSize * _systemTextScaleFactor;
    }
    return adjustedFontSize;
  }
}