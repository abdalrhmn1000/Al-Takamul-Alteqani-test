import 'package:al_takamul_alteqani_test/core/presentation/themes/app_theme.dart';
import 'package:al_takamul_alteqani_test/core/presentation/utils/generated/translation/translations.dart';
import 'package:flutter/material.dart';

class RegularBottomSheetLayout extends StatelessWidget {
  const RegularBottomSheetLayout({
    super.key,
    required this.body,
    this.bodyPadding,
    this.actions,
    this.height,
    this.title,
    this.showDoneBtn = false,
    this.showCancelBtn = false,
    this.enableDrag = true,
    this.doneTxt,
    this.cancelTxt,
    this.onDone,
    this.onCancel,
    this.doneFlex = 5,
    this.cancelFlex = 2,
  });
  final Widget body;
  final EdgeInsets? bodyPadding;
  final List<Widget>? actions;
  final double? height;
  final String? title;
  final bool showDoneBtn;
  final bool showCancelBtn;
  final bool enableDrag;
  final String? doneTxt;
  final String? cancelTxt;
  final void Function()? onDone;
  final void Function()? onCancel;
  final int doneFlex;
  final int cancelFlex;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: height ?? MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: Theme.of(context).appColors.greyColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (title != null)
                  Text(
                    title!,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                if (actions != null) Row(children: actions!)
              ],
            ),
          ),
          Expanded(
            child: body,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              children: [
                if (showCancelBtn) ...[
                  Expanded(
                    flex: cancelFlex,
                    child: OutlinedButton(
                      onPressed: onCancel,
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Theme.of(context).appColors.topAndNav,
                      ),
                      child:
                          Text(cancelTxt ?? Translations.of(context)!.cancel),
                    ),
                  ),
                  const SizedBox(width: 22),
                ],
                if (showDoneBtn)
                  Expanded(
                    flex: doneFlex,
                    child: ElevatedButton(
                      onPressed: onDone,
                      child: Text(doneTxt ?? Translations.of(context)!.done),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
