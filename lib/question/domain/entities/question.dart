import 'package:al_takamul_alteqani_test/question/domain/entities/owner.dart';

class Question {
  final int questionId;
  final List<String>? tags;
  final Owner? owner;
  final bool? isAnswered;
  final int? viewCount;
  final int? answerCount;
  final int? score;
  final DateTime? lastActivityDate;
  final DateTime? creationDate;
  final String? title;
  final String? link;
  final String? contentLicense;

  Question({
    required this.questionId,
    this.tags,
    this.owner,
    this.isAnswered,
    this.viewCount,
    this.answerCount,
    this.score,
    this.lastActivityDate,
    this.creationDate,
    this.title,
    this.link,
    this.contentLicense,
  });
}
