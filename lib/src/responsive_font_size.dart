part of responsive_tools;

enum TextSize {
  XS,
  S,
  M,
  L,
  XL,
}

double getMobileFontSize(TextSize textSize) {
  switch (textSize) {
    case TextSize.XS: return SizeTools().adjustFontSize(28);
    case TextSize.S: return SizeTools().adjustFontSize(36);
    case TextSize.M: return SizeTools().adjustFontSize(44);
    case TextSize.L: return SizeTools().adjustFontSize(52);
    case TextSize.XL: return SizeTools().adjustFontSize(60);
    default: return SizeTools().adjustFontSize(44);
  }
}

double getTabletFontSize(TextSize textSize) {
  switch (textSize) {
    case TextSize.XS: return SizeTools().adjustFontSize(10);
    case TextSize.S: return SizeTools().adjustFontSize(15);
    case TextSize.M: return SizeTools().adjustFontSize(20);
    case TextSize.L: return SizeTools().adjustFontSize(25);
    case TextSize.XL: return SizeTools().adjustFontSize(30);
    default: return SizeTools().adjustFontSize(20);
  }
}

double getDeviceFontSize(TextSize textSize, SizingInformation sizingInformation) {
  if (sizingInformation.deviceScreenType == DeviceScreenType.tablet ||
      sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
    return getTabletFontSize(textSize);
  } else {
    return getMobileFontSize(textSize);
  }
}