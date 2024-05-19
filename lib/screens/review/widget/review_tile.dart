import 'package:flutter/material.dart';
import 'package:shoesly/models/review_model.dart';
import 'package:shoesly/utils/constants/extensions.dart';
import 'package:shoesly/utils/routes/app_assets_routes.dart';
import 'package:shoesly/utils/theme/colors.dart';
import 'package:shoesly/widgets/custom_cached_netwoking.dart';
import 'package:shoesly/widgets/widget_method.dart';

class ReviewTile extends StatelessWidget {
  final Review review;
  const ReviewTile({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.borderColor,
                border: Border.all(
                  color: AppColors.primaryColorLighter,
                )),
            clipBehavior: Clip.antiAlias,
            child: const CustomCachedNetworkImage(
              imageUrl: "imageUrl",
              placeHolderImage: AppAssetsRoutes.defaultAvatarPath,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        review.name ?? "Anonymous",
                        style: theme.textTheme.titleLarge?.copyWith(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      review.date.toString().parseTimeAgo,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppColors.primaryColorLighter,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                getRatingCount(
                  userRating: review.rating?.toInt() ?? 0,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  review.description ?? "--:--",
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
