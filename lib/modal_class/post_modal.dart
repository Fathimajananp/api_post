// To parse this JSON data, do
//
//     final createuser = createuserFromJson(jsonString);

import 'dart:convert';

Createuser createuserFromJson(String str) => Createuser.fromJson(json.decode(str));

String createuserToJson(Createuser data) => json.encode(data.toJson());

class Createuser {
  final String name;
  final String job;
  final int id;


  Createuser({
    required this.name,
    required this.job,
    required this.id,

  });

  factory Createuser.fromJson(Map<String, dynamic> json) => Createuser(
    name: json["name"],
    job: json["job"],
    id: json["id"],

  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "job": job,
    "id": id,

  };
}

class Meta {
  final String poweredBy;
  final String docsUrl;
  final String upgradeUrl;
  final String exampleUrl;
  final String variant;
  final String message;
  final Cta cta;
  final String context;

  Meta({
    required this.poweredBy,
    required this.docsUrl,
    required this.upgradeUrl,
    required this.exampleUrl,
    required this.variant,
    required this.message,
    required this.cta,
    required this.context,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    poweredBy: json["powered_by"],
    docsUrl: json["docs_url"],
    upgradeUrl: json["upgrade_url"],
    exampleUrl: json["example_url"],
    variant: json["variant"],
    message: json["message"],
    cta: Cta.fromJson(json["cta"]),
    context: json["context"],
  );

  Map<String, dynamic> toJson() => {
    "powered_by": poweredBy,
    "docs_url": docsUrl,
    "upgrade_url": upgradeUrl,
    "example_url": exampleUrl,
    "variant": variant,
    "message": message,
    "cta": cta.toJson(),
    "context": context,
  };
}

class Cta {
  final String label;
  final String url;

  Cta({
    required this.label,
    required this.url,
  });

  factory Cta.fromJson(Map<String, dynamic> json) => Cta(
    label: json["label"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "url": url,
  };
}
