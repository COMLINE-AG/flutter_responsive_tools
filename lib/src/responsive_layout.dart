part of responsive_tools;

/// Simple wrapper for providing different layouts for mobile/tablet and portrait/landscape combinations. Usage:
///
/// ResponsiveLayout(
///   mobilePortrait: Text("mobile portrait layout"),
///   mobileLandscape: Text("mobile landscape layout"),
///   tabletPortrait: Text("tablet portrait layout"),
///   tabletLandscape: Text("mobile landscape layout"),
/// )
class ResponsiveLayout extends StatelessWidget {
  final Widget mobilePortrait;
  final Widget mobileLandscape;
  final Widget tabletPortrait;
  final Widget tabletLandscape;

  ResponsiveLayout({
    @required this.mobilePortrait,
    @required this.mobileLandscape,
    @required this.tabletPortrait,
    @required this.tabletLandscape,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayoutBuilder(
        portrait: (context) => mobilePortrait,
        landscape: (context) => mobileLandscape,
      ),
      tablet: OrientationLayoutBuilder(
        portrait: (context) => tabletPortrait,
        landscape: (context) => tabletLandscape,
      ),
    );
  }
}
