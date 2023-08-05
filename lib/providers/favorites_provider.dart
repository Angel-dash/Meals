import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]); //super to reach our parent clas

//once define you cannot add or remove the super list
//hence you need to create a new one
//state property is local is availabe thanks to state notifer
// hence it hold data i.e list of meals in this case
  void toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      //this checks is the list is favorite or not
      // if yes then it will remove it
      //keep meal is it's id is not equal to the meal
      //in the super list
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
