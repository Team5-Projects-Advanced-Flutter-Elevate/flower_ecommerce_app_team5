class GetTermsEntity {
  final List<TermsAndConditionEntity> termsAndConditions;

  GetTermsEntity({required this.termsAndConditions});
}

class TermsAndConditionEntity {
  final String? section;
  final TermsAndConditionContentEntity? content;
  final StyleEntity? style;
  final TitleEntity? title;

  TermsAndConditionEntity({
    required this.section,
    required this.content,
    required this.style,
    required this.title,
  });
}

class TermsAndConditionContentEntity {
  final dynamic? en;
  final dynamic? ar;

  TermsAndConditionContentEntity({
    required this.en,
    required this.ar,
  });
}

class StyleEntity {
  final int? fontSize;
  final String? fontWeight;
  final String? color;
  final TitleEntity? textAlign;
  final String? backgroundColor;
  final TitleClassEntity? title;
  final TitleClassEntity? content;

  StyleEntity({
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    required this.textAlign,
    required this.backgroundColor,
    required this.title,
    required this.content,
  });
}

class TitleClassEntity {
  final int? fontSize;
  final String? fontWeight;
  final String? color;
  final TitleEntity? textAlign;
  final String? backgroundColor;

  TitleClassEntity({
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    required this.textAlign,
    required this.backgroundColor,
  });
}

class TitleEntity {
  final String? en;
  final String? ar;

  TitleEntity({
    required this.en,
    required this.ar,
  });
}
