import 'package:flutter_meal_app/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesMealsNotifier extends StateNotifier<List<Meal>> {
  FavoritesMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final isFavoriteMeal = state.contains(meal);

    if (isFavoriteMeal) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoritesMealsNotifier, List<Meal>>(
  (ref) {
    return FavoritesMealsNotifier();
  },
);
