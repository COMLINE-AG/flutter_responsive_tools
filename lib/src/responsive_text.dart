part of responsive_tools;

/// Wrapper for Text Widget that handles responsive font size. Usage:
///
/// ResponsiveText(
///   text: "Lorem ipsum dolor",
///   size: TextSize.M,
///   color: Colors.red,
/// )
class ResponsiveText extends StatelessWidget {
  static const MAX_TEXT_LINES = 1000000;

  final String text;
  final Key? textKey;
  final TextSize? size;
  final Color? color;
  final String? fontFamily;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;
  final String? semanticsLabel;

  ResponsiveText({
    required this.text,
    this.textKey,
    this.size,
    this.color,
    this.fontFamily,
    this.overflow,
    this.maxLines,
    this.textAlign,
    this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return _buildText(getDeviceFontSize(size ?? TextSize.M, sizingInformation), context);
      },
    );
  }

  Text _buildText(double fontSize, BuildContext context) {
    return Text(
      text,
      key: textKey,
      semanticsLabel: semanticsLabel ?? text,
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: maxLines ?? MAX_TEXT_LINES,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        fontSize: fontSize,
        color: color ?? Theme.of(context).textTheme.bodyText1?.color,
        fontFamily: fontFamily ?? Theme.of(context).textTheme.bodyText1?.fontFamily,
      ),
    );
  }
}
