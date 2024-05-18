import 'package:shoesly/models/product_model.dart';
import 'package:shoesly/models/review_model.dart';

class ReviewScreenArgument {
  final List<Review> reviews;
  final String averageRating;
  const ReviewScreenArgument({
    required this.reviews,
    required this.averageRating,
  });
}
