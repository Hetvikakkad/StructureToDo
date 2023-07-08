import 'dart:convert';

ToDo todoFromJson(String str) => ToDo.fromJson(json.decode(str));

String todoToJson(ToDo data) => json.encode(data.toJson());

class ToDo {
  String content;
  dynamic checked;
  String id;

  ToDo({
    required this.content,
    required this.checked,
    required this.id,

  });

  factory ToDo.fromJson(Map<String, dynamic> json) => ToDo(
    content: json["content"],
    checked: json["checked"],
    id:  json["_id"],

  );
  Map<String, dynamic> toJson() => {
    "content": content,
    "checked": checked,
    "_id":id,
  };
}
