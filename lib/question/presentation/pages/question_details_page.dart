import 'package:al_takamul_alteqani_test/core/presentation/cubits/base_states/base_state.dart';
import 'package:al_takamul_alteqani_test/core/presentation/themes/app_theme.dart';
import 'package:al_takamul_alteqani_test/core/presentation/utils/generated/translation/translations.dart';
import 'package:al_takamul_alteqani_test/core/presentation/widgets/custom_card_widget.dart';
import 'package:al_takamul_alteqani_test/core/presentation/widgets/custom_rich_text.dart';
import 'package:al_takamul_alteqani_test/core/presentation/widgets/error_view.dart';
import 'package:al_takamul_alteqani_test/core/presentation/widgets/inkwell_without_feedback.dart';
import 'package:al_takamul_alteqani_test/core/presentation/widgets/loader.dart';
import 'package:al_takamul_alteqani_test/injection.dart';
import 'package:al_takamul_alteqani_test/question/domain/entities/question.dart';
import 'package:al_takamul_alteqani_test/question/presentation/cubits/get_question_by_id_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class QuestionDetailsPage extends StatefulWidget {
  static const String path = 'questionDetailsPage';
  final int id;

  const QuestionDetailsPage({
    super.key,
    required this.id,
  });

  @override
  State<QuestionDetailsPage> createState() => _QuestionDetailsPageState();
}

class _QuestionDetailsPageState extends State<QuestionDetailsPage> {
  final GetQuestionByIdCubit _getQuestionByIdCubit =
      getIt<GetQuestionByIdCubit>();

  @override
  void initState() {
    _getQuestionByIdCubit.get(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tr = Translations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr.questionDetails,
        ),
      ),
      body: BlocBuilder<GetQuestionByIdCubit, BaseState<Question>>(
        bloc: _getQuestionByIdCubit,
        builder: (context, state) {
          if (state.isInProgress) {
            return const Loader();
          } else if (state.isFailure) {
            return ErrorView(
              failure: state.failure,
              onRetry: () {
                _getQuestionByIdCubit.get(widget.id);
              },
            );
          } else if (state.isSuccess) {
            return SingleChildScrollView(
              padding: const EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWellWithoutFeedback(
                    onTap: () {
                      if (state.item?.owner?.link != null) {
                        launchUrl(Uri.parse(state.item!.owner!.link!));
                      }
                    },
                    child: CustomCardWidget(
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: state.item?.owner?.profileImage != null
                                      ? CachedNetworkImage(
                                          imageUrl:
                                              state.item!.owner!.profileImage!,
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        )
                                      : const Icon(Icons.account_circle_rounded,
                                          size: 40),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            state.item?.owner?.displayName ??
                                                '',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge),
                                        Text(state.item?.owner?.userType ?? '',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .appColors
                                                      .textColor
                                                      .grey,
                                                )),
                                      ],
                                    ),
                                  ),
                                ),
                                if (state.item?.owner?.link != null)
                                  const Icon(Icons.arrow_forward),
                              ],
                            ),
                          ],
                        )),
                  ),
                  if (state.item?.title != null)
                    CustomCardWidget(
                        margin: const EdgeInsets.only(
                          bottom: 16,
                        ),
                        child: CustomTextRich(
                          title: tr.question,
                          body: state.item!.title!,
                        )),
                  if (state.item?.link != null)
                    InkWellWithoutFeedback(
                      onTap: () {
                        launchUrl(Uri.parse(state.item!.link!));
                      },
                      child: CustomCardWidget(
                          margin: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(tr.linkQuestion,
                                  style:
                                      Theme.of(context).textTheme.bodyMedium!),
                              const Icon(Icons.arrow_forward)
                            ],
                          )),
                    ),
                  if (state.item?.tags != null)
                    _CustomTextDetailsWidget(
                        title: tr.tags,
                        body: state.item!.tags!.map((e) => e).toString()),
                  if (state.item?.score != null)
                    _CustomTextDetailsWidget(
                      title: tr.score,
                      body: state.item!.score!.toString(),
                      colorTextBody: Theme.of(context).primaryColor,
                    ),
                  if (state.item?.answerCount != null)
                    _CustomTextDetailsWidget(
                      title: tr.answers,
                      body: state.item!.answerCount!.toString(),
                      colorTextBody: Theme.of(context).primaryColor,
                    ),
                  if (state.item?.creationDate != null)
                    _CustomTextDetailsWidget(
                        title: tr.creationDate,
                        body: DateFormat('yyyy, MMM, dd')
                            .format(state.item!.creationDate!)),
                  if (state.item?.contentLicense != null)
                    _CustomTextDetailsWidget(
                        title: tr.contentLicense,
                        body: state.item!.contentLicense!),
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class _CustomTextDetailsWidget extends StatelessWidget {
  final String title;
  final String body;
  final Color? colorTextBody;

  const _CustomTextDetailsWidget({
    required this.title,
    required this.body,
    this.colorTextBody,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).appColors.textColor.grey)),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                body,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: colorTextBody,
                    ),
              ),
            )
          ],
        ));
  }
}
