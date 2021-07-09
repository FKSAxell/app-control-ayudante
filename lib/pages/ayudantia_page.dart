import 'package:flutter/material.dart';

class AyudantiaPage extends StatelessWidget {
  const AyudantiaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Color(0xff243165),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Materias",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ],
            ),
          ),
          SizedBox.expand(
            child: DraggableScrollableSheet(
              initialChildSize: 0.6,
              minChildSize: 0.6,
              expand: false,
              builder: (_, controller) {
                return Container(
                  color: Color(0xffE5E9F2),
                  child: ListView.builder(
                    itemCount: 30,
                    controller: controller, // set this too
                    itemBuilder: (_, i) => ListTile(title: Text('Item $i')),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
