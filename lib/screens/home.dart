import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildHomeBard(),
      body: _buidHomeBody(),
    );
  }

  Widget _buildHomeBard() {
    return AppBar(
      title: Text("Cozinhando em casa"),
    );
  }

  Widget _buidHomeBody() {
    return SizedBox(
      height: 300,
      child: Card(
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                _buildCardImage(
                    'https://cdn.guiadacozinha.com.br/wp-content/uploads/2019/11/bolinho-de-chuva-tradicional-receita-1.jpg'),
                _buildCardText("Bolinhos de chuva"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardImage(String cardImageUrl) {
    return Image.network(
      cardImageUrl,
      fit: BoxFit.fill,
      height: 268,
    );
  }

  Widget _buildCardText(String cardText) {
    return Positioned(
      bottom: 10,
      left: 10,
      child: Text(
        cardText,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
