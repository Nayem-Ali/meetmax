class Event {
  String title;
  String description;
  String icon;
  List<String>? seen;

  Event({required this.title, required this.description, required this.icon, this.seen});

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        title: json["title"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'icon': icon,
        'seen': seen!.isNotEmpty ? seen!.map((v) => v.toString()).toList() : [],
      };
}
