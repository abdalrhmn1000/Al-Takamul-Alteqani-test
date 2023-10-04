import 'package:flutter/material.dart';
import 'package:al_takamul_alteqani_test/core/domain/entities/enums/server_error_code.dart';
import 'package:al_takamul_alteqani_test/core/domain/entities/failures.dart';
import 'package:al_takamul_alteqani_test/core/presentation/utils/generated/translation/translations.dart';

class ErrorView extends StatefulWidget {
  final String? message;
  final Function? onRetry;
  final Failure? failure;
  final Map<ServerErrorCode, String>? customMessages;

  const ErrorView({
    Key? key,
    this.message,
    this.onRetry,
    this.failure,
    this.customMessages,
  }) : super(key: key);

  @override
  State<ErrorView> createState() => _ErrorViewState();
}

class _ErrorViewState extends State<ErrorView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            _getErrorMessage,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        if (widget.onRetry != null) ...[
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () => widget.onRetry!(),
            child: Text(Translations.of(context)!.retry),
          ),
        ]
      ],
    );
  }

  String get _getErrorMessage {
    String errorMessage = Translations.of(context)!.errorMessage;

    if (widget.failure != null) {
      if (widget.failure is ServerFailure) {
        if ((widget.failure as ServerFailure?)!.errorCode ==
            ServerErrorCode.forbidden) {
          errorMessage = Translations.of(context)!.accessDeniedMessage;
        } else if ((widget.failure as ServerFailure?)!.errorCode ==
            ServerErrorCode.unauthenticated) {
          errorMessage = Translations.of(context)!.unauthenticatedMessage;
        } else if (widget.customMessages != null &&
            widget.customMessages!.isNotEmpty &&
            widget.customMessages![
                    (widget.failure as ServerFailure?)!.errorCode] !=
                null) {
          errorMessage = widget
              .customMessages![(widget.failure as ServerFailure?)!.errorCode]!;
        } else if ((widget.failure as ServerFailure?)!.message.isNotEmpty) {
          errorMessage = (widget.failure as ServerFailure?)!.message;
        }
      } else if (widget.failure is NetworkFailure) {
        errorMessage = Translations.of(context)!.noInternetConnection;
      }
    } else if (widget.message != null) {
      errorMessage = widget.message!;
    }
    return errorMessage;
  }
}
