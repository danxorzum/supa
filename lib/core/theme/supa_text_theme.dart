part of 'theme.dart';

class SupaTextTheme {
  ///The [TextTheme] of the app.
  const SupaTextTheme(
      {required this.display,
      required this.headline,
      required this.title,
      required this.label,
      required this.body});

  factory SupaTextTheme.fromMaterial(TextTheme theme) => SupaTextTheme(
        display: theme.bodyMedium ?? supaTextTheme.display,
        headline: theme.headlineMedium ?? supaTextTheme.headline,
        title: theme.titleMedium ?? supaTextTheme.title,
        label: theme.labelMedium ?? supaTextTheme.label,
        body: theme.bodyMedium ?? supaTextTheme.body,
      );

  final TextStyle display;
  final TextStyle headline;
  final TextStyle title;
  final TextStyle label;
  final TextStyle body;

  SupaTextTheme copyWith(
          {TextStyle? display,
          TextStyle? headline,
          TextStyle? title,
          TextStyle? label,
          TextStyle? body}) =>
      SupaTextTheme(
        display: display ?? this.display,
        headline: headline ?? this.headline,
        title: title ?? this.title,
        label: label ?? this.label,
        body: body ?? this.body,
      );

  SupaTextTheme get large => scale(1.1);
  SupaTextTheme get small => scale(0.9);

  SupaTextTheme scale(double scale) => SupaTextTheme(
        display: display.copyWith(fontSize: display.fontSize! * scale),
        headline: headline.copyWith(fontSize: headline.fontSize! * scale),
        title: title.copyWith(fontSize: title.fontSize! * scale),
        label: label.copyWith(fontSize: label.fontSize! * scale),
        body: body.copyWith(fontSize: body.fontSize! * scale),
      );

  SupaTextTheme screenScale(ScreenSize screenSize, SupaTextTheme base,
      {TextThemeScales? textSettings}) {
    final settings = textSettings ?? TextThemeScales();
    log(base.body.fontSize.toString());
    log(body.fontSize.toString());
    switch (screenSize) {
      case ScreenSize.w:
        return copyWith(
          display: display.copyWith(
              fontSize: settings.wScale * base.display.fontSize!),
          headline: headline.copyWith(
              fontSize: settings.wScale * base.headline.fontSize!),
          title:
              title.copyWith(fontSize: settings.wScale * base.title.fontSize!),
          label:
              label.copyWith(fontSize: settings.wScale * base.label.fontSize!),
          body: body.copyWith(fontSize: settings.wScale * base.body.fontSize!),
        );
      case ScreenSize.xs:
        return copyWith(
          display: display.copyWith(
              fontSize: settings.xsScale * base.display.fontSize!),
          headline: headline.copyWith(
              fontSize: settings.xsScale * base.headline.fontSize!),
          title:
              title.copyWith(fontSize: settings.xsScale * base.title.fontSize!),
          label:
              label.copyWith(fontSize: settings.xsScale * base.label.fontSize!),
          body: body.copyWith(fontSize: settings.xsScale * base.body.fontSize!),
        );
      case ScreenSize.s:
        return copyWith(
          display: display.copyWith(
              fontSize: settings.sBigScale * base.display.fontSize!),
          headline: headline.copyWith(
              fontSize: settings.sBigScale * base.headline.fontSize!),
          title: title.copyWith(
              fontSize: settings.sBigScale * base.title.fontSize!),
          label: label.copyWith(
              fontSize: settings.sBigScale * base.label.fontSize!),
          body:
              body.copyWith(fontSize: settings.sBigScale * base.body.fontSize!),
        );

      case ScreenSize.m:
        return copyWith(
          display: display.copyWith(
              fontSize: settings.mScale * base.display.fontSize!),
          headline: headline.copyWith(
              fontSize: settings.mScale * base.headline.fontSize!),
          title:
              title.copyWith(fontSize: settings.mScale * base.title.fontSize!),
          label:
              label.copyWith(fontSize: settings.mScale * base.label.fontSize!),
          body: body.copyWith(fontSize: settings.mScale * base.body.fontSize!),
        );
      case ScreenSize.l:
        return copyWith(
          display: display.copyWith(
              fontSize: settings.lScale * base.display.fontSize!),
          headline: headline.copyWith(
              fontSize: settings.lScale * base.headline.fontSize!),
          title:
              title.copyWith(fontSize: settings.lScale * base.title.fontSize!),
          label:
              label.copyWith(fontSize: settings.lScale * base.label.fontSize!),
          body: body.copyWith(fontSize: settings.lScale * base.body.fontSize!),
        );
      case ScreenSize.xl:
        return copyWith(
          display: display.copyWith(
              fontSize: settings.xlScale * base.display.fontSize!),
          headline: headline.copyWith(
              fontSize: settings.xlScale * base.headline.fontSize!),
          title:
              title.copyWith(fontSize: settings.xlScale * base.title.fontSize!),
          label:
              label.copyWith(fontSize: settings.xlScale * base.label.fontSize!),
          body: body.copyWith(fontSize: settings.xlScale * base.body.fontSize!),
        );
    }
  }

  TextTheme get toMaterial => TextTheme(
        displayLarge: display.copyWith(fontSize: display.fontSize! * 1.2),
        displayMedium: display,
        displaySmall: display.copyWith(fontSize: display.fontSize! * 0.8),
        headlineLarge: headline.copyWith(fontSize: headline.fontSize! * 1.2),
        headlineMedium: headline,
        headlineSmall: headline.copyWith(fontSize: headline.fontSize! * 0.8),
        titleLarge: title.copyWith(fontSize: title.fontSize! * 1.2),
        titleMedium: title,
        titleSmall: title.copyWith(fontSize: title.fontSize! * 0.8),
        labelLarge: label.copyWith(fontSize: label.fontSize! * 1.2),
        labelMedium: label,
        labelSmall: label.copyWith(fontSize: label.fontSize! * 0.6),
        bodyLarge: body.copyWith(fontSize: body.fontSize! * 1.2),
        bodyMedium: body,
        bodySmall: body.copyWith(fontSize: body.fontSize! * 0.8),
      );
  //TODO: done this shit
  CupertinoTextThemeData get toCupertino => CupertinoTextThemeData(
        primaryColor: SupaThemeData.light().primary.color,
        actionTextStyle: _actionTextStyle,
        dateTimePickerTextStyle: _dateTimePickerTextStyle,
        navActionTextStyle: _actionTextStyle,
        navLargeTitleTextStyle: _largeTitleTextStyle,
        navTitleTextStyle: _middleTitleTextStyle,
        pickerTextStyle: _pickerTextStyle,
        tabLabelTextStyle: _tabLabelTextStyle,
        textStyle: _textStyle,
      );
}

const TextStyle _textStyle = TextStyle(
  inherit: false,
  fontFamily: '.SF Pro Text',
  fontSize: 17.0,
  letterSpacing: -0.41,
  color: CupertinoColors.label,
  decoration: TextDecoration.none,
);
const TextStyle _actionTextStyle = TextStyle(
  inherit: false,
  fontFamily: '.SF Pro Text',
  fontSize: 17.0,
  letterSpacing: -0.41,
  color: CupertinoColors.activeBlue,
  decoration: TextDecoration.none,
);
const TextStyle _tabLabelTextStyle = TextStyle(
  inherit: false,
  fontFamily: '.SF Pro Text',
  fontSize: 10.0,
  fontWeight: FontWeight.w500,
  letterSpacing: -0.24,
  color: CupertinoColors.inactiveGray,
);

const TextStyle _middleTitleTextStyle = TextStyle(
  inherit: false,
  fontFamily: '.SF Pro Text',
  fontSize: 17.0,
  fontWeight: FontWeight.w600,
  letterSpacing: -0.41,
  color: CupertinoColors.label,
);

const TextStyle _largeTitleTextStyle = TextStyle(
  inherit: false,
  fontFamily: '.SF Pro Display',
  fontSize: 34.0,
  fontWeight: FontWeight.w700,
  letterSpacing: 0.41,
  color: CupertinoColors.label,
);
const TextStyle _pickerTextStyle = TextStyle(
  inherit: false,
  fontFamily: '.SF Pro Display',
  fontSize: 21.0,
  fontWeight: FontWeight.w400,
  letterSpacing: -0.6,
  color: CupertinoColors.label,
);
const TextStyle _dateTimePickerTextStyle = TextStyle(
  inherit: false,
  fontFamily: '.SF Pro Display',
  fontSize: 21,
  fontWeight: FontWeight.normal,
  color: CupertinoColors.label,
);

const supaTextTheme = SupaTextTheme(
  display: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  ),
  headline: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  ),
  title: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  ),
  label: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  ),
  body: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  ),
);
