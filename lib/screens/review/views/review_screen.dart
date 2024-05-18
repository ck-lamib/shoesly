import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoesly/models/review_model.dart';
import 'package:shoesly/screens/review/widget/arguments/review_screen_arg.dart';
import 'package:shoesly/screens/review/widget/review_tile.dart';
import 'package:shoesly/utils/constants/app_constants.dart';
import 'package:shoesly/utils/routes/app_assets_routes.dart';
import 'package:shoesly/widgets/custom_app_bar.dart';

class ReviewScreen extends StatelessWidget {
  static const String routeName = "/review-screen";
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ReviewScreenArgument;
    return ReviewView(
      reviewScreenArgument: args,
    );
  }
}

class ReviewView extends StatelessWidget {
  final ReviewScreenArgument reviewScreenArgument;
  const ReviewView({
    super.key,
    required this.reviewScreenArgument,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    // var height = MediaQuery.sizeOf(context).height;
    // var width = MediaQuery.sizeOf(context).width;
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Review(${reviewScreenArgument.reviews.length})",
          actions: [
            Row(
              children: [
                SvgPicture.asset(
                  AppAssetsRoutes.starPath,
                  height: 12,
                  width: 12,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  reviewScreenArgument.averageRating,
                  style: theme.textTheme.titleLarge,
                ),
              ],
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, value) => [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: false,
              floating: true,
              flexibleSpace: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(
                  left: appHorizontalPadding,
                ),
                child: const TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  tabs: [
                    Tab(
                      child: Text(
                        "All",
                      ),
                    ),
                    Tab(
                      child: Text(
                        "5 Stars",
                      ),
                    ),
                    Tab(
                      child: Text(
                        "4 Stars",
                      ),
                    ),
                    Tab(
                      child: Text(
                        "3 Stars",
                      ),
                    ),
                    Tab(
                      child: Text(
                        "2 Stars",
                      ),
                    ),
                    Tab(
                      child: Text(
                        "1 Stars",
                      ),
                    ),
                    Tab(
                      child: Text(
                        "0 Stars",
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: appHorizontalPadding,
              vertical: appHorizontalPadding / 2,
            ),
            child: TabBarView(
              children: [
                //all tabview
                ReviewTabView(
                  reveiwList: reviewScreenArgument.reviews,
                ),
                ReviewTabView(
                  reveiwList: [],
                ),
                ReviewTabView(
                  reveiwList: [],
                ),
                ReviewTabView(
                  reveiwList: [],
                ),
                ReviewTabView(
                  reveiwList: [],
                ),
                ReviewTabView(
                  reveiwList: [],
                ),
                ReviewTabView(
                  reveiwList: [],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReviewTabView extends StatelessWidget {
  const ReviewTabView({
    super.key,
    required this.reveiwList,
  });
  final List<Review> reveiwList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      itemCount: reveiwList.length,
      itemBuilder: (context, index) {
        return ReviewTile(
          review: Review(),
        );
      },
    );
  }
}
