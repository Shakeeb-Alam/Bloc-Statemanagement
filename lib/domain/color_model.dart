class Notes {
  String title;
  String description;
  final double redValue;
  final double greenValue;
  final double blueValue;
  final double opacityValue;

  Notes(
      {required this.title,
        required this.description,
        required this.redValue,
        required this.greenValue,
        required this.blueValue,
        required this.opacityValue});

  factory Notes.fromJson(Map<String, dynamic> json) {
    return Notes(
        title: json['title'],
        description: json['description'],
        redValue: json['redValue'],
        greenValue: json['greenValue'],
        blueValue: json['blueValue'],
        opacityValue: json['opacityValue']);
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "description": description,
      "redValue": redValue,
      "greenValue": greenValue,
      "blueValue": blueValue,
      "opacityValue": opacityValue,
    };
  }
}