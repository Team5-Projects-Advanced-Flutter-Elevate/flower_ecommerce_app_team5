import '../../../domain/entities/about_us.dart';

class AboutUs {
  AboutUs({
    required this.aboutApp,
  });

  final List<AboutApp> aboutApp;

  AboutUs copyWith({
    List<AboutApp>? aboutApp,
  }) {
    return AboutUs(
      aboutApp: aboutApp ?? this.aboutApp,
    );
  }

  factory AboutUs.fromJson(Map<String, dynamic> json) {
    return AboutUs(
      aboutApp: json["about_app"] == null
          ? []
          : List<AboutApp>.from(
              json["about_app"]!.map((x) => AboutApp.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "about_app": aboutApp.map((x) => x.toJson()).toList(),
      };
}

class AboutApp {
  AboutApp({
    required this.section,
    required this.content,
    required this.style,
    required this.title,
  });

  final String? section;
  final AboutAppContent? content;
  final Style? style;
  final Title? title;

  AboutApp copyWith({
    String? section,
    AboutAppContent? content,
    Style? style,
    Title? title,
  }) {
    return AboutApp(
      section: section ?? this.section,
      content: content ?? this.content,
      style: style ?? this.style,
      title: title ?? this.title,
    );
  }

  factory AboutApp.fromJson(Map<String, dynamic> json) {
    return AboutApp(
      section: json["section"],
      content: json["content"] == null
          ? null
          : AboutAppContent.fromJson(json["content"]),
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

class AboutAppContent {
  AboutAppContent({
    required this.en,
    required this.ar,
  });

  final dynamic en;
  final dynamic ar;

  AboutAppContent copyWith({
    dynamic en,
    dynamic ar,
  }) {
    return AboutAppContent(
      en: en ?? this.en,
      ar: ar ?? this.ar,
    );
  }

  factory AboutAppContent.fromJson(Map<String, dynamic> json) {
    return AboutAppContent(
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

  Style copyWith({
    int? fontSize,
    String? fontWeight,
    String? color,
    Title? textAlign,
    String? backgroundColor,
    TitleClass? title,
    TitleClass? content,
  }) {
    return Style(
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      color: color ?? this.color,
      textAlign: textAlign ?? this.textAlign,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

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

  TitleClass copyWith({
    int? fontSize,
    String? fontWeight,
    String? color,
    Title? textAlign,
    String? backgroundColor,
  }) {
    return TitleClass(
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      color: color ?? this.color,
      textAlign: textAlign ?? this.textAlign,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

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

  Title copyWith({
    String? en,
    String? ar,
  }) {
    return Title(
      en: en ?? this.en,
      ar: ar ?? this.ar,
    );
  }

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
extension AboutUsMapper on AboutUs {
  AboutUsEntity toEntity() {
    return AboutUsEntity(
      aboutApp: aboutApp.map((e) => e.toEntity()).toList(),
    );
  }
}
extension AboutAppMapper on AboutApp {
  AboutAppEntity toEntity() {
    return AboutAppEntity(
      section: section,
      content: content?.toEntity(),
      style: style?.toEntity(),
      title: title?.toEntity(),
    );
  }
}
extension AboutAppContentMapper on AboutAppContent {
  LocalizedContentEntity toEntity() {
    return LocalizedContentEntity(
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
  StyleDetailEntity toEntity() {
    return StyleDetailEntity(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      textAlign: textAlign?.toEntity(),
      backgroundColor: backgroundColor,
    );
  }
}

extension TitleMapper on Title {
  LocalizedTextEntity toEntity() {
    return LocalizedTextEntity(
      en: en,
      ar: ar,
    );
  }
}


