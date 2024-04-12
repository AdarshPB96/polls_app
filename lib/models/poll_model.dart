class Poll {
  final String id;
  final String topic;
  final String statement;
  final String pollType;
  final List<String> textOptions;

  Poll({
    required this.id,
    required this.topic,
    required this.statement,
    required this.pollType,
    required this.textOptions,
  });

  factory Poll.fromJson(Map<String, dynamic> json) {
    return Poll(
      id: json['_id'],
      topic: json['topic'],
      statement: json['statement'],
      pollType: json['poll_type'],
      textOptions: List<String>.from(json['text_options']),
    );
  }
}
