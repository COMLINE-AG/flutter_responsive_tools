part of responsive_tools;

/// Wrapper for Text Widget that handles responsive font size. Usage:
///
/// ResponsiveText(
///   text: "Lorem ipsum dolor",
///   size: TextSize.M,
///   color: Colors.red,
/// )
class ResponsiveText extends StatelessWidget {
  final String text;
  final TextSize size;
  final Color? color;
  final String? fontFamily;

  ResponsiveText({
    required this.text,
    required this.size,
    this.color,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _buildText(getMobileFontSize(size), context),
      tablet: _buildText(getTabletFontSize(size), context),
    );
  }

  Text _buildText(double fontSize, BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color != null ? color : Theme.of(context).textTheme.bodyText1!.color,
        fontFamily: fontFamily != null ? fontFamily : Theme.of(context).textTheme.bodyText1!.fontFamily,
      ),
    );
  }
}