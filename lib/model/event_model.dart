import 'dart:convert';

Event eventFromJson(String str) => Event.fromJson(json.decode(str));

String eventToJson(Event data) => json.encode(data.toJson());

class Event {
  String title;
  String description;
  String icon;
  List<String>? seen;

  Event({
    required this.title,
    required this.description,
    required this.icon,
    this.seen,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    title: json["title"],
    description: json["description"],
    icon: json["icon"],
    seen: List<String>.from(json["seen"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "icon": icon,
    "seen": List<dynamic>.from(seen!.map((x) => x)),
  };
}
