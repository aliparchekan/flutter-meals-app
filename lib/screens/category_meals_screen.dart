import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';

import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availabelMeals;

  CategoryMealsScreen(this.availabelMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  String categoryId;
  Color categoryColor;
  List<Meal> displayedMeals;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    categoryTitle = routeArgs['title'];
    categoryId = routeArgs['id'];
    categoryColor = routeArgs['color'];
    displayedMeals = widget.availabelMeals
        .where((element) => element.categories.contains(categoryId))
        .toList();
    super.didChangeDependencies();
  }

  // void removeItem(String itemId) {
  //   setState(() {
  //     displayedMeals.removeWhere((element) => element.id == itemId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: categoryColor),
      child: Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            Meal item = displayedMeals[index];
            return MealItem(
              title: item.title,
              imageUrl: item.imageUrl,
              duration: item.duration,
              complexity: item.complexity,
              affordability: item.affordability,
              id: item.id,
            );
          },
          itemCount: displayedMeals.length,
        ),
      ),
    );
  }
}
