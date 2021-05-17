part of responsive_tools;

class ResponsiveRichText extends StatelessWidget {
  final List<ResponsiveText> children;

  ResponsiveRichText({required this.children});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return RichText(
          text: TextSpan(
            children: [
              for (ResponsiveText child in children)
                _buildResponsiveTextSpan(
                  child,
                  getDeviceFontSize(child.size ?? TextSize.M, sizingInformation),
                  context,
                )
            ],
          ),
        );
      },
    );
  }

  TextSpan _buildResponsiveTextSpan(ResponsiveText responsiveText, double fontSize, BuildContext context) {
    TextStyle style = TextStyle(
      fontSize: fontSize,
      color: responsiveText.color ?? Theme.of(context).textTheme.bodyText1!.color,
      fontFamily: responsiveText.fontFamily ?? Theme.of(context).textTheme.bodyText1!.fontFamily,
    );
    return TextSpan(
      text: responsiveText.text,
      style: style,
    );
  }
}
