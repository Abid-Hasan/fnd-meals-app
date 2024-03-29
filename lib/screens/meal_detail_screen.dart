// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static String routeName = "/meal-detail";
  final Function toggleFavorite;
  final Function isFavorite;

  const MealDetailScreen(this.toggleFavorite, this.isFavorite, {Key key})
      : super(key: key);

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _buildSectionContainer({Widget child}) {
    return Container(
      height: 200,
      width: 300,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Scrollbar(
        isAlwaysShown: true,
        thickness: 8,
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildSectionTitle(context, 'Ingredients'),
            _buildSectionContainer(
              child: ListView.builder(
                itemBuilder: ((context, index) => Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 15,
                        ),
                        child: Text(selectedMeal.ingredients[index]),
                      ),
                    )),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            _buildSectionTitle(context, "Steps"),
            _buildSectionContainer(
              child: ListView.builder(
                itemBuilder: ((context, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text("# ${index + 1}"),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        Divider(),
                      ],
                    )),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(selectedMeal.id) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(selectedMeal.id),
      ),
    );
  }
}
