class Efoem {
  String? text;
  String? second;

  Efoem({this.text, this.second});

  factory Efoem.fromJson(Map<String, dynamic> json) =>
      Efoem(text: json['text'], second: json['second']);

  Map<String, dynamic> toJson() => {'text': text, 'second': second};
}
