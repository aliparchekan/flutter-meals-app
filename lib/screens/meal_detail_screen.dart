import 'package:flutter/material.dart';

import '../dummy_data.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/category/meal';

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final id = routeArgs['id'];
    final color = routeArgs['color'];
    final Meal mealItem = DUMMY_MEALS.firstWhere((element) => element.id == id);
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: color,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(mealItem.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  mealItem.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              _buildSectionTitle(context, 'Ingredients'),
              _buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Center(child: Text(mealItem.ingredients[index])),
                      ),
                    );
                  },
                  itemCount: mealItem.ingredients.length,
                ),
              ),
              _buildSectionTitle(context, "Steps"),
              _buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('#${index + 1}'),
                          ),
                          title: Text(mealItem.steps[index]),
                          dense: true,
                        ),
                        Divider(),
                      ],
                    );
                  },
                  itemCount: mealItem.steps.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
