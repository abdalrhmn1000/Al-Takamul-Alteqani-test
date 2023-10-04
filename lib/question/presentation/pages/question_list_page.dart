import 'package:al_takamul_alteqani_test/core/presentation/pages/settings_page.dart';
import 'package:al_takamul_alteqani_test/core/presentation/utils/generated/translation/translations.dart';
import 'package:al_takamul_alteqani_test/core/presentation/widgets/listview_pagination_widget.dart';
import 'package:al_takamul_alteqani_test/core/presentation/widgets/screen_loader.dart';
import 'package:al_takamul_alteqani_test/injection.dart';
import 'package:al_takamul_alteqani_test/question/domain/entities/question.dart';
import 'package:al_takamul_alteqani_test/question/presentation/cubits/get_question_list_cubit.dart';
import 'package:al_takamul_alteqani_test/question/presentation/pages/question_details_page.dart';
import 'package:al_takamul_alteqani_test/question/presentation/widgets/question_list/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuestionListPage extends StatefulWidget {
  static const String path = '/questionListPage';

  const QuestionListPage({super.key});

  @override
  State<QuestionListPage> createState() => _QuestionListPageState();
}

class _QuestionListPageState extends State<QuestionListPage> with ScreenLoader {
  final GetQuestionListCubit _getQuestionListCubit =
      getIt<GetQuestionListCubit>();


  @override
  Widget screen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.of(context)!.questions),
        actions: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: GestureDetector(
        onTap: (){
            context.pushNamed(SettingsPage.path);
        }
        ,child:const Icon(Icons.settings_rounded),),
         )
        ],
      ),
      body: ListViewPaginationWidget<Question>(
        paginationCubit: _getQuestionListCubit,
        itemBuilder: (data) => GestureDetector(
            onTap: () {
              context.pushNamed(QuestionDetailsPage.path,
                  extra: data.questionId);
            },
            child: QuestionWidget(
              question: data,
            )),
      ),
    );
  }
}
