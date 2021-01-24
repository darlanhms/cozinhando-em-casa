import 'package:flutter/material.dart';
import 'package:cozinhandoemcasa/models/recipe.dart';

class Detail extends StatelessWidget {
  final Recipe recipe;

  Detail({Key key, @required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Receita")),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildDetailImage(recipe.image),
            _buildDetailTitle(recipe.title),
            _buildDetailsRow("${recipe.portions} porções", recipe.prepareTime),
            _buildSubtitle('Ingredientes'),
            _buildDetailsText(recipe.ingredients),
            _buildSubtitle('Modo de preparo'),
            _buildDetailsText(recipe.howto),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailImage(String imageAsset) {
    return Image.asset(imageAsset);
  }

  Widget _buildDetailTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.deepOrange,
          fontSize: 30,
        ),
      ),
    );
  }

  Widget _buildDetailsRow(String portions, String prepareTime) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        children: <Widget>[
          _buildDetailsColumn(
            Icons.restaurant,
            portions,
          ),
          _buildDetailsColumn(
            Icons.timer,
            prepareTime,
          )
        ],
      ),
    );
  }

  Widget _buildDetailsColumn(IconData icon, String text) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.deepOrange,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubtitle(String subtitle) {
    return Text(
      subtitle,
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }

  Widget _buildDetailsText(String text) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Text(text),
    );
  }
}
