import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:receipe_app/ui/extension/build_context_extension.dart';
import 'package:stacked/stacked.dart';
import 'overlay_loader_model.dart';

class OverlayLoader extends StackedView<OverlayLoaderModel> {
  final bool isBusy;
  final Widget content;
  const OverlayLoader({
    super.key,
    this.isBusy = false,
    required this.content,
  });

  @override
  Widget builder(
    BuildContext context,
    OverlayLoaderModel viewModel,
    Widget? child,
  ) {
    List<Widget> children = [content];

    if (isBusy) {
      children.add(
        Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: context.palette?.gray6,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: const CircularProgressIndicator.adaptive(),
          ),
        ),
      );
    }

    return Stack(
      children: children,
    );
  }

  @override
  OverlayLoaderModel viewModelBuilder(
    BuildContext context,
  ) =>
      OverlayLoaderModel();
}
