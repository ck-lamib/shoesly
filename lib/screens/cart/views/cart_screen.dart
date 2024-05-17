import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoesly/screens/filter/bloc/filter_bloc.dart';
import 'package:shoesly/screens/order/views/order_screen.dart';
import 'package:shoesly/utils/constants/app_constants.dart';
import 'package:shoesly/utils/constants/enums.dart';
import 'package:shoesly/utils/helpers/logger.dart';
import 'package:shoesly/utils/routes/app_assets_routes.dart';
import 'package:shoesly/utils/theme/colors.dart';
import 'package:shoesly/utils/theme/typography/font_weights.dart';
import 'package:shoesly/widgets/custom_app_bar.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = "/cart-screen";
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CartView();
  }
}

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    // var height = MediaQuery.sizeOf(context).height;
    // var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Cart",
      ),
      body: SingleChildScrollView(
        child: Slidable(
          key: Key("0"),
          endActionPane: ActionPane(
            closeThreshold: 0.9,
            motion: const ScrollMotion(),
            dismissible: DismissiblePane(
              closeOnCancel: true,
              confirmDismiss: () async {
                bool success = await showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          "Do you want to remove this product?",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, false);
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () async {},
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    });
                return success;
              },
              onDismissed: () async {
                // bool success = await hc.deletePassword(passwordTable);
                // if (success) {
                //   hc.passwords?.remove(passwordTable);
                //   Fluttertoast.showToast(msg: "Passowrd deleted successfully");
                // }
              },
            ),
            children: [
              SlidableAction(
                borderRadius: BorderRadius.circular(15),
                onPressed: (val) {
                  showDialog(
                    barrierDismissible: true,
                    context: val,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          "Do you want to remove this product?",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, false);
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () async {},
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                backgroundColor: theme.colorScheme.error,
                foregroundColor: Colors.white,
                icon: Icons.delete,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: appHorizontalPadding,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: LayoutBuilder(
                    builder: (context, constraint) {
                      return Center(
                        child: Container(
                          width: constraint.maxWidth,
                          height: constraint.maxWidth,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(appBorderRadiusSize),
                            color: AppColors.primaryColorLightest,
                          ),
                          child: Image.asset(
                            AppAssetsRoutes.shoesPath,
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jordan 1 Retro High Tie Dye laksd flasd",
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: AppFontWeight.semiBold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Nike . Red Grey . 40",
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: AppColors.secondaryDarkColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text.rich(
                                TextSpan(
                                  text: "\$",
                                  style: theme.textTheme.titleLarge,
                                  children: const [
                                    TextSpan(
                                      text: "235,00",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    CustomLogger.trace("tap remove");
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.primaryColorLighter,
                                        ),
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      Icons.remove,
                                      color: AppColors.primaryColorLighter,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "1",
                                  style: theme.textTheme.titleLarge,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    CustomLogger.trace("tap add");
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.primaryColorDefault,
                                        ),
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      Icons.add,
                                      color: AppColors.primaryColorDefault,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: kBottomNavigationBarHeight + 40,
        padding: EdgeInsets.symmetric(
          horizontal: appHorizontalPadding,
        ),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            blurStyle: BlurStyle.outer,
            blurRadius: 30,
            color: AppColors.shadowColor.withOpacity(0.5),
            spreadRadius: 0,
          ),
        ]),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Grand Total",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.primaryColorLighter,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text.rich(
                    TextSpan(
                      text: "\$",
                      style: theme.textTheme.headlineMedium,
                      children: const [
                        TextSpan(
                          text: "235,00",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(OrderScreen.routeName);
                },
                child: Text("Check out".toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
