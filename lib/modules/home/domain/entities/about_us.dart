class AboutUsEntity {
  final List<AboutAppEntity> aboutApp;

  const AboutUsEntity({required this.aboutApp});
}

class AboutAppEntity {
  final String? section;
  final LocalizedContentEntity? content;
  final StyleEntity? style;
  final LocalizedTextEntity? title;

  const AboutAppEntity({
    required this.section,
    required this.content,
    required this.style,
    required this.title,
  });
}

class LocalizedContentEntity {
  final dynamic en;
  final dynamic ar;

  const LocalizedContentEntity({
    required this.en,
    required this.ar,
  });
}

class StyleEntity {
  final int? fontSize;
  final String? fontWeight;
  final String? color;
  final LocalizedTextEntity? textAlign;
  final String? backgroundColor;
  final StyleDetailEntity? title;
  final StyleDetailEntity? content;

  const StyleEntity({
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    required this.textAlign,
    required this.backgroundColor,
    required this.title,
    required this.content,
  });
}

class StyleDetailEntity {
  final int? fontSize;
  final String? fontWeight;
  final String? color;
  final LocalizedTextEntity? textAlign;
  final String? backgroundColor;

  const StyleDetailEntity({
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    required this.textAlign,
    required this.backgroundColor,
  });
}

class LocalizedTextEntity {
  final String? en;
  final String? ar;

  const LocalizedTextEntity({
    required this.en,
    required this.ar,
  });
}
