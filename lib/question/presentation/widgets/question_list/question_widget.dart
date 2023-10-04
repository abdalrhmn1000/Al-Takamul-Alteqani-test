import 'package:al_takamul_alteqani_test/core/presentation/themes/app_theme.dart';
import 'package:al_takamul_alteqani_test/core/presentation/utils/generated/translation/translations.dart';
import 'package:al_takamul_alteqani_test/core/presentation/widgets/custom_card_widget.dart';
import 'package:al_takamul_alteqani_test/question/domain/entities/question.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as time_ago;

class QuestionWidget extends StatelessWidget {
  final Question question;

  const QuestionWidget({
    super.key,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context)!;
    return CustomCardWidget(
        margin: const EdgeInsets.only(
          bottom: 16,
          right: 16,
          left: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: question.owner?.profileImage != null
                      ? CachedNetworkImage(
                          imageUrl: question.owner!.profileImage!,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.account_circle_rounded, size: 40),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(question.owner?.displayName ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyLarge),
                        Text(
                          question.owner?.userType ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                         style:   Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Theme.of(context).appColors.textColor.grey,
                            )
                        ),
                      ],
                    ),
                  ),
                ),
                if (question.creationDate != null)
                  Text(getTimeAge(question.creationDate!)),
              ],
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(question.title ?? '',
                  maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (question.answerCount != null)
                  _TextConfigWidget(
                    title: tr.answers,
                    count: question.answerCount!,
                  ),
                if (question.answerCount != null && question.score != null)
                  const SizedBox(
                    height: 30,
                    child: VerticalDivider(
                      width: 2,
                    ),
                  ),
                if (question.score != null)
                  _TextConfigWidget(
                    title: tr.score,
                    count: question.score!,
                  ),
              ],
            )
          ],
        ));
  }

  String getTimeAge(DateTime loadedTime) {
    time_ago.setLocaleMessages('en', time_ago.EnMessages());
    return time_ago.format(loadedTime, locale: 'en', allowFromNow: true);
  }
}

class _TextConfigWidget extends StatelessWidget {
  final String title;
  final int count;

  const _TextConfigWidget({
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 120,
      child: Column(
        children: [
          Text(count.toString(),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).primaryColor,
                  )),
          const SizedBox(
            height: 2,
          ),
          Text(title),
        ],
      ),
    );
  }
}
