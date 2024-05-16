import 'package:flutter/material.dart';
import 'package:shoesly/utils/theme/colors.dart';
import 'package:shoesly/widgets/widget_method.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 20,
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Bimal khatri",
                        style: theme.textTheme.titleLarge?.copyWith(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Today",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppColors.primaryColorLighter,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                getRatingCount(userRating: 5),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Perfect for keeping your feet dry and warm in damp conditions. ",
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
