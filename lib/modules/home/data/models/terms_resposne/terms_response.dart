import '../../../domain/entities/terms.dart';

class GetTerms {
  GetTerms({
    required this.termsAndConditions,
  });

  final List<TermsAndCondition> termsAndConditions;

  factory GetTerms.fromJson(Map<String, dynamic> json) {
    return GetTerms(
      termsAndConditions: json["terms_and_conditions"] == null
          ? []
          : List<TermsAndCondition>.from(json["terms_and_conditions"]!
              .map((x) => TermsAndCondition.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "terms_and_conditions":
            termsAndConditions.map((x) => x.toJson()).toList(),
      };
}

class TermsAndCondition {
  TermsAndCondition({
    required this.section,
    required this.content,
    required this.style,
    required this.title,
  });

  final String? section;
  final TermsAndConditionContent? content;
  final Style? style;
  final Title? title;

  factory TermsAndCondition.fromJson(Map<String, dynamic> json) {
    return TermsAndCondition(
      section: json["section"],
      content: json["content"] == null
          ? null
          : TermsAndConditionContent.fromJson(json["content"]),
      style: json["style"] == null ? null : Style.fromJson(json["style"]),
      title: json["title"] == null ? null : Title.fromJson(json["title"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "section": section,
        "content": content?.toJson(),
        "style": style?.toJson(),
        "title": title?.toJson(),
      };
}

class TermsAndConditionContent {
  TermsAndConditionContent({
    required this.en,
    required this.ar,
  });

  final dynamic en;
  final dynamic ar;

  factory TermsAndConditionContent.fromJson(Map<String, dynamic> json) {
    return TermsAndConditionContent(
      en: json["en"],
      ar: json["ar"],
    );
  }

  Map<String, dynamic> toJson() => {
        "en": en,
        "ar": ar,
      };
}

class Style {
  Style({
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    required this.textAlign,
    required this.backgroundColor,
    required this.title,
    required this.content,
  });

  final int? fontSize;
  final String? fontWeight;
  final String? color;
  final Title? textAlign;
  final String? backgroundColor;
  final TitleClass? title;
  final TitleClass? content;

  factory Style.fromJson(Map<String, dynamic> json) {
    return Style(
      fontSize: json["fontSize"],
      fontWeight: json["fontWeight"],
      color: json["color"],
      textAlign:
          json["textAlign"] == null ? null : Title.fromJson(json["textAlign"]),
      backgroundColor: json["backgroundColor"],
      title: json["title"] == null ? null : TitleClass.fromJson(json["title"]),
      content:
          json["content"] == null ? null : TitleClass.fromJson(json["content"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "fontSize": fontSize,
        "fontWeight": fontWeight,
        "color": color,
        "textAlign": textAlign?.toJson(),
        "backgroundColor": backgroundColor,
        "title": title?.toJson(),
        "content": content?.toJson(),
      };
}

class TitleClass {
  TitleClass({
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    required this.textAlign,
    required this.backgroundColor,
  });

  final int? fontSize;
  final String? fontWeight;
  final String? color;
  final Title? textAlign;
  final String? backgroundColor;

  factory TitleClass.fromJson(Map<String, dynamic> json) {
    return TitleClass(
      fontSize: json["fontSize"],
      fontWeight: json["fontWeight"],
      color: json["color"],
      textAlign:
          json["textAlign"] == null ? null : Title.fromJson(json["textAlign"]),
      backgroundColor: json["backgroundColor"],
    );
  }

  Map<String, dynamic> toJson() => {
        "fontSize": fontSize,
        "fontWeight": fontWeight,
        "color": color,
        "textAlign": textAlign?.toJson(),
        "backgroundColor": backgroundColor,
      };
}

class Title {
  Title({
    required this.en,
    required this.ar,
  });

  final String? en;
  final String? ar;

  factory Title.fromJson(Map<String, dynamic> json) {
    return Title(
      en: json["en"],
      ar: json["ar"],
    );
  }

  Map<String, dynamic> toJson() => {
        "en": en,
        "ar": ar,
      };
}

extension GetTermsMapper on GetTerms {
  GetTermsEntity toEntity() {
    return GetTermsEntity(
      termsAndConditions: termsAndConditions.map((e) => e.toEntity()).toList(),
    );
  }
}

extension TermsAndConditionMapper on TermsAndCondition {
  TermsAndConditionEntity toEntity() {
    return TermsAndConditionEntity(
      section: section,
      content: content?.toEntity(),
      style: style?.toEntity(),
      title: title?.toEntity(),
    );
  }
}

extension TermsAndConditionContentMapper on TermsAndConditionContent {
  TermsAndConditionContentEntity toEntity() {
    return TermsAndConditionContentEntity(
      en: en,
      ar: ar,
    );
  }
}

extension StyleMapper on Style {
  StyleEntity toEntity() {
    return StyleEntity(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      textAlign: textAlign?.toEntity(),
      backgroundColor: backgroundColor,
      title: title?.toEntity(),
      content: content?.toEntity(),
    );
  }
}

extension TitleClassMapper on TitleClass {
  TitleClassEntity toEntity() {
    return TitleClassEntity(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      textAlign: textAlign?.toEntity(),
      backgroundColor: backgroundColor,
    );
  }
}

extension TitleMapper on Title {
  TitleEntity toEntity() {
    return TitleEntity(
      en: en,
      ar: ar,
    );
  }
}
