import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/ui/common/ui_helpers.dart';
import 'package:receipe_app/ui/dialogs/delete_dish/delete_dish_dialog_viewmodel.dart';
import 'package:receipe_app/ui/extension/app_typography.dart';
import 'package:receipe_app/ui/extension/palette.dart';
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
    late ThemeData theme = Theme.of(context);
    AppTypography? typography = theme.extension<AppTypography>();
    Palette? palette = theme.extension<Palette>();

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
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0.h, horizontal: 20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Delete Dish',
                  style: typography?.headlineBold22,
                ),
                verticalSpaceTiny,
                Text(
                  'Are you sure you want to delete this dish?',
                  textAlign: TextAlign.center,
                  style: typography?.labelRegular16,
                ),
                40.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        buttonText: 'Cancel',
                        color: Color(0xFFE8E8E8),
                        textColor: palette?.gray12,
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
                        buttonText: 'Yes',
                        onTap: () {
                          completer(
                            DialogResponse(confirmed: true),
                          );
                        },
                        color: Color(0xFFCC444B),
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
