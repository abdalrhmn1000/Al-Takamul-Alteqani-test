import 'package:al_takamul_alteqani_test/core/presentation/cubits/language_cubit/language_cubit.dart';
import 'package:al_takamul_alteqani_test/core/presentation/cubits/theme_cubit/theme_cubit.dart';
import 'package:al_takamul_alteqani_test/core/presentation/themes/app_theme.dart';
import 'package:al_takamul_alteqani_test/core/presentation/utils/generated/translation/translations.dart';
import 'package:al_takamul_alteqani_test/core/presentation/widgets/custom_card_widget.dart';
import 'package:al_takamul_alteqani_test/core/presentation/widgets/inkwell_without_feedback.dart';
import 'package:al_takamul_alteqani_test/core/presentation/widgets/regular_bottom_sheet_layout.dart';
import 'package:al_takamul_alteqani_test/core/presentation/widgets/screen_loader.dart';
import 'package:al_takamul_alteqani_test/core/presentation/widgets/screen_utils.dart';
import 'package:al_takamul_alteqani_test_plugin/al_takamul_alteqani_test_plugin.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class SettingsPage extends StatefulWidget {
  static const String path = '/settingsPage';

  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with ScreenLoader, ScreenUtils {
  final AlTakamulAlteqaniTestPlugin _alTakamulAlteqaniTestPluinPlugin =
      AlTakamulAlteqaniTestPlugin();
  ThemeEnum _themeEnum = ThemeEnum.system;
  LanguagesEnum _languagesEnum = LanguagesEnum.english;

  @override
  Widget screen(BuildContext context) {
    final tr = Translations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.settings),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            InkWellWithoutFeedback(
              onTap: () async {
                startLoading();
                bool result = await InternetConnectionChecker().hasConnection;
                if (result == true) {
                  var response =
                      await _alTakamulAlteqaniTestPluinPlugin.callAPI();
                  if (response ?? false) {
                    showSuccess();
                  } else {
                    showError();
                  }
                } else {
                  showError(
                    customMessage: tr.noInternetConnection,
                  );
                }

                stopLoading();
              },
              child: CustomCardWidget(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tr.callApiFromPlugin,
                          style: Theme.of(context).textTheme.bodyMedium!),
                      const Icon(Icons.arrow_forward)
                    ],
                  )),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(context: context, builder: (_)=>RegularBottomSheetLayout(height: 200,
                    title: tr.theme,
                    body: _BodySettingWidget<ThemeEnum>(
                      list: ThemeEnum.values,
                      onChange: (theme) {
                        setState(() {
                          _themeEnum = theme;
                        });
                        BlocProvider.of<ThemeCubit>(context)
                            .setTheme(ThemeMode.values.firstWhere(
                              (element) => element.name == theme.name,
                        ));
                      },
                      tr: tr.themeEnum,
                      init: ThemeEnum.values.firstWhereOrNull((element) =>
                      BlocProvider.of<ThemeCubit>(context)
                          .themeMode
                          ?.name ==
                          element.name) ??
                          _themeEnum,
                    )));

              },
              child: _CustomCardWidget(
                title: tr.theme,
                widget: Text(
                  tr.themeEnum(
                    ThemeEnum.values
                        .firstWhereOrNull((element) =>
                    (BlocProvider.of<ThemeCubit>(context)
                        .themeMode
                        ?.name) ==
                        element.name)
                        ?.name ??
                        _themeEnum.name,
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(context: context, builder:(_)=> RegularBottomSheetLayout( height: 200, title: tr.language,
                    body: _BodySettingWidget<LanguagesEnum>(
                      list: LanguagesEnum.values,
                      onChange: (language) {
                        setState(() {
                          _languagesEnum = language;
                        });
                        BlocProvider.of<LanguageCubit>(context)
                            .setLanguage(language.name);
                      },
                      tr: tr.languageEnum,
                      init: LanguagesEnum.values.firstWhereOrNull((element) =>
                      BlocProvider.of<LanguageCubit>(context).lang ==
                          element.name) ??
                          _languagesEnum,
                      showSubTitle: true,
                    )));

              },
              child: _CustomCardWidget(
                title: tr.language,
                widget: Text(
                  tr.languageEnum(
                    LanguagesEnum.values
                        .firstWhereOrNull((element) =>
                    (BlocProvider.of<LanguageCubit>(context)
                        .lang) ==
                        element.name)
                        ?.name ??
                        _languagesEnum.name,
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomCardWidget extends StatelessWidget {
  final String title;
  final Widget widget;

  const _CustomCardWidget({required this.title, required this.widget});

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      margin: const EdgeInsets.only(
        bottom: 16,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          widget,
        ],
      ),
    );
  }
}

class _BodySettingWidget<T> extends StatefulWidget {
  final List<T> list;
  final T? init;
  final Function(T) onChange;
  final String Function(String) tr;
  final bool showSubTitle;

  const _BodySettingWidget({
    super.key,
    required this.list,
    required this.onChange,
    this.init,
    required this.tr,
    this.showSubTitle = false,
  });

  @override
  State<_BodySettingWidget<T>> createState() => _BodySettingWidgetState<T>();
}

class _BodySettingWidgetState<T> extends State<_BodySettingWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.list.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // print(widget.list[index]);
              widget.onChange(widget.list[index]);
              context.pop();
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  widget.list[index] == widget.init
                      ? Icon(
                          Icons.radio_button_checked_rounded,
                          color: Theme.of(context).primaryColor,
                        )
                      : Icon(
                          Icons.radio_button_off_rounded,
                          color: Theme.of(context).appColors.greyColor,
                        ),
                  const SizedBox(
                    width: 6,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.tr(widget.list[index].toString()),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      if (widget.showSubTitle) ...[
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '${widget.list[index].toString().split('.').last.substring(0, 1).toUpperCase()}${widget.list[index].toString().split('.').last.substring(1).toLowerCase()}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                color:
                                    Theme.of(context).appColors.textColor.grey,
                              ),
                        ),
                      ]
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}

enum LanguagesEnum {
  english,
  arabic,
}

enum ThemeEnum {
  system,
  light,
  dark,
}
