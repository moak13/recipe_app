import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/generated/l10n.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/dialogs/delete_dish/delete_dish_dialog_viewmodel.dart';
import 'package:receipe_app/ui/extension/build_context_extension.dart';
import 'package:receipe_app/ui/widgets/common/primary_button/primary_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DeleteDishDialog extends StatelessWidget {
  const DeleteDishDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);
  final DialogRequest request;
  final Function(DialogResponse) completer;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DeleteDishDialogModel>.reactive(
      viewModelBuilder: () => DeleteDishDialogModel(),
      builder: (
        BuildContext context,
        DeleteDishDialogModel model,
        Widget? child,
      ) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          backgroundColor: context.palette?.white,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0.h, horizontal: 20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  S.current.delete_dish,
                  style: context.typography?.headlineBold22,
                ),
                verticalSpaceTiny,
                Text(
                  S.current.are_you_sure,
                  textAlign: TextAlign.center,
                  style: context.typography?.labelRegular16,
                ),
                40.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        buttonText: S.current.cancel,
                        color: context.palette?.gray13,
                        textColor: context.palette?.gray12,
                        borderRadius: 20.r,
                        onTap: () {
                          completer(
                            DialogResponse(confirmed: false),
                          );
                        },
                      ),
                    ),
                    horizontalSpaceMedium,
                    Expanded(
                      child: PrimaryButton(
                        buttonText: S.current.yes,
                        onTap: () {
                          completer(
                            DialogResponse(confirmed: true),
                          );
                        },
                        color: context.palette?.redShade,
                        borderRadius: 20.r,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
