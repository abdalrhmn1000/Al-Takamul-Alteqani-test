import 'package:al_takamul_alteqani_test/question/data/models/owner_model/owner_model.dart';
import 'package:al_takamul_alteqani_test/question/domain/entities/question.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question_model.g.dart';

@JsonSerializable(createToJson: true)
class QuestionModel {
  @JsonKey(name: 'question_id')
  final int questionId;
  final List<String>? tags;
  final OwnerModel? owner;
  @JsonKey(name: 'is_answered')
  final bool? isAnswered;
  @JsonKey(name: 'view_count')
  final int? viewCount;
  @JsonKey(name: 'answer_count')
  final int? answerCount;
  final int? score;
  @JsonKey(name: 'last_activity_date')
  final int? lastActivityDate;
  @JsonKey(name: 'creation_date')
  final int? creationDate;
  final String? title;
  final String? link;
  @JsonKey(name: 'content_license')
  final String? contentLicense;

  QuestionModel(
    this.questionId,
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
  );

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}

extension MapToDomain on QuestionModel {
  Question toDomain() => Question(
        questionId: questionId,
        tags: tags,
        owner: owner?.toDomain(),
        isAnswered: isAnswered,
        viewCount: viewCount,
        answerCount: answerCount,
        score: score,
        lastActivityDate: lastActivityDate != null
            ? DateTime.fromMillisecondsSinceEpoch(lastActivityDate! * 1000)
            : null,
        creationDate: creationDate != null
            ? DateTime.fromMillisecondsSinceEpoch(creationDate! * 1000)
            : null,
        title: title,
        link: link,
        contentLicense: contentLicense,
      );
}
