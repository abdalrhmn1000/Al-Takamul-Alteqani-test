import 'package:al_takamul_alteqani_test/core/domain/entities/enums/server_error_code.dart';
import 'package:al_takamul_alteqani_test/core/domain/entities/failures.dart';
import 'package:al_takamul_alteqani_test/core/presentation/themes/app_theme.dart';
import 'package:al_takamul_alteqani_test/core/presentation/utils/generated/translation/translations.dart';
import 'package:flutter/material.dart';

mixin ScreenUtils<T extends StatefulWidget> on State<T> {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? handleError(
      {Failure? failure,
      String? customMessage,
      Map<ServerErrorCode, String>? customMessages,
      bool isFloating = false}) {
    return showError(
        failure: failure,
        customMessage: customMessage,
        customMessages: customMessages,
        isFloating: isFloating);
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showError(
      {Failure? failure,
      String? customMessage,
      Map<ServerErrorCode, String>? customMessages,
      bool isFloating = false}) {
    String message = customMessage ?? Translations.of(context)!.errorMessage;
    if (failure != null) {
      if (failure is ServerFailure) {
        if (failure.errorCode == ServerErrorCode.forbidden) {
          message = Translations.of(context)!.accessDeniedMessage;
        } else if (failure.errorCode == ServerErrorCode.unauthenticated) {
          message = Translations.of(context)!.unauthenticatedMessage;
        } else if (customMessages != null &&
            customMessages.isNotEmpty &&
            customMessages[failure.errorCode] != null) {
          message = customMessages[failure.errorCode] ??
              Translations.of(context)!.errorMessage;
        } else if (failure.message.isNotEmpty) {
          message = failure.message;
        }
      } else if (failure is NetworkFailure) {
        message = Translations.of(context)!.noInternetConnection;
      }
    }

    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          Icon(Icons.error_outline,
              color: Theme.of(context).appColors.whiteColor),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Theme.of(context).appColors.whiteColor),
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).appColors.errorColor,
      behavior: isFloating ? SnackBarBehavior.floating : null,
    ));
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSuccess(
      {String? customMessage, bool isFloating = false}) {
    String message = customMessage ?? Translations.of(context)!.success;

    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Theme.of(context).appColors.textColor),
      ),
      backgroundColor: Theme.of(context).appColors.primaryColor,
      behavior: isFloating ? SnackBarBehavior.floating : null,
    ));
  }
}
