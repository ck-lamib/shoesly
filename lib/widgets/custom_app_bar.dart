import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoesly/utils/constants/app_constants.dart';
import 'package:shoesly/utils/routes/app_assets_routes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.hasLeading = true,
    this.leading,
    this.automaticallyImplyLeading = false,
    this.title,
    this.flexibleSpace,
    this.actions,
    this.elevation,
    this.backgroundColor,
    this.foregroundColor,
    this.centerTitle = true,
    this.leadingWidth = 24,
    this.titleTextStyle,
    this.bottom,
    this.bottomOpacity = 1.0,
    this.titileSpacing,
    this.padding,
    this.titleWidget,
  });
  final bool hasLeading;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final String? title;
  final Widget? titleWidget;
  final Widget? flexibleSpace;
  final List<Widget>? actions;
  final double? elevation;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool? centerTitle;
  final double? leadingWidth;
  final TextStyle? titleTextStyle;
  final PreferredSizeWidget? bottom;
  final double bottomOpacity;
  final double? titileSpacing;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: appHorizontalPadding),
      child: AppBar(
        scrolledUnderElevation: 0,
        leading: leading ??
            (hasLeading
                ? InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      AppAssetsRoutes.arrowBackPath,
                    ),
                  )
                : null),
        automaticallyImplyLeading: automaticallyImplyLeading,
        title: title != null
            ? Text(title!,
                style: titleTextStyle ?? Theme.of(context).textTheme.titleLarge)
            : titleWidget,
        actions: actions,
        elevation: 0,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        centerTitle: centerTitle,
        leadingWidth: leadingWidth,
        titleTextStyle: titleTextStyle,
        titleSpacing: titileSpacing,
        bottom: bottom,
        bottomOpacity: bottomOpacity,
        flexibleSpace: flexibleSpace,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
