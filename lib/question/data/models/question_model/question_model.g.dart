// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    QuestionModel(
      json['question_id'] as int,
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['owner'] == null
          ? null
          : OwnerModel.fromJson(json['owner'] as Map<String, dynamic>),
      json['is_answered'] as bool?,
      json['view_count'] as int?,
      json['answer_count'] as int?,
      json['score'] as int?,
      json['last_activity_date'] as int?,
      json['creation_date'] as int?,
      json['title'] as String?,
      json['link'] as String?,
      json['content_license'] as String?,
    );

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) =>
    <String, dynamic>{
      'question_id': instance.questionId,
      'tags': instance.tags,
      'owner': instance.owner,
      'is_answered': instance.isAnswered,
      'view_count': instance.viewCount,
      'answer_count': instance.answerCount,
      'score': instance.score,
      'last_activity_date': instance.lastActivityDate,
      'creation_date': instance.creationDate,
      'title': instance.title,
      'link': instance.link,
      'content_license': instance.contentLicense,
    };
