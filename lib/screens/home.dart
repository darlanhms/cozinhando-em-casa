import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:cozinhandoemcasa/models/recipe.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildHomeBar(),
      body: _buildCardList(),
    );
  }

  Widget _buildHomeBar() {
    return AppBar(
      title: Text("Cozinhando em casa"),
    );
  }

  Widget _buildCardList() {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('assets/receitas.json'),
      builder: (context, snapshot) {
        List<dynamic> recipes = json.decode(snapshot.data.toString());

        return ListView.builder(
          itemCount: recipes != null ? recipes.length : 0,
          itemBuilder: (context, index) {
            Recipe recipe = Recipe.fromJson(recipes[index]);
            return _buildCard(recipe.title, recipe.image);
          },
        );
      },
    );
  }

  Widget _buildCard(String cardTitle, String cardImageUrl) {
    return SizedBox(
      height: 300,
      child: Card(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                _buildCardImage(cardImageUrl),
                _buildCardGradient(),
                _buildCardText(cardTitle),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardImage(String cardImageUrl) {
    return Image.asset(
      cardImageUrl,
      fit: BoxFit.fill,
      height: 260,
    );
  }

  Widget _buildCardText(String cardText) {
    return Positioned(
      bottom: 10,
      left: 10,
      child: Text(
        cardText,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildCardGradient() {
    return Container(
      height: 260,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: FractionalOffset.topCenter,
        end: FractionalOffset.bottomCenter,
        colors: [
          Colors.transparent,
          Colors.deepOrange,
        ],
      )),
    );
  }
}
