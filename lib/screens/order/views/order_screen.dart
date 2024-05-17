import 'package:flutter/material.dart';
import 'package:shoesly/utils/constants/app_constants.dart';
import 'package:shoesly/utils/theme/colors.dart';
import 'package:shoesly/utils/theme/typography/font_weights.dart';
import 'package:shoesly/widgets/custom_app_bar.dart';

class OrderScreen extends StatelessWidget {
  static const String routeName = "/order-screen";
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const OrderView();
  }
}

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    // var height = MediaQuery.sizeOf(context).height;
    // var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Order Summary",
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: appHorizontalPadding),
        children: [
          Text(
            "Information",
            style: theme.textTheme.headlineMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Payment Method",
              style: theme.textTheme.titleLarge,
            ),
            subtitle: Text(
              "Credit Card",
              style: theme.textTheme.bodyLarge?.copyWith(
                color: AppColors.secondaryDarkColor,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: AppColors.primaryColorLighter,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            color: AppColors.primaryColorLighter,
          ),
          const SizedBox(
            height: 5,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Location",
              style: theme.textTheme.titleLarge,
            ),
            subtitle: Text(
              "Pokhara, Nepal",
              style: theme.textTheme.bodyLarge?.copyWith(
                color: AppColors.secondaryDarkColor,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: AppColors.primaryColorLighter,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Order Detail",
            style: theme.textTheme.headlineMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Nike . Red Grey . 40",
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: AppColors.secondaryDarkColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text.rich(
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
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Nike . Red Grey . 40",
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: AppColors.secondaryDarkColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text.rich(
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
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Payment Detail",
            style: theme.textTheme.headlineMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "Sub Total ",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: AppColors.secondaryDarkColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "\$",
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: AppFontWeight.semiBold,
                  ),
                  children: const [
                    TextSpan(
                      text: "235,00",
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "Shipping",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: AppColors.secondaryDarkColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "\$",
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: AppFontWeight.semiBold,
                  ),
                  children: const [
                    TextSpan(
                      text: "20,00",
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            color: AppColors.primaryColorLighter,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "Total Order",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: AppColors.secondaryDarkColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "\$",
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: AppFontWeight.semiBold,
                  ),
                  children: const [
                    TextSpan(
                      text: "20,00",
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: kBottomNavigationBarHeight + 40,
        padding: const EdgeInsets.symmetric(
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
                onPressed: () {},
                child: Text("Check out".toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
