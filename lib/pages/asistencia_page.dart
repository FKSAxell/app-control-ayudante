import 'package:flutter/material.dart';

class AsistenciaPage extends StatefulWidget {
  AsistenciaPage({Key? key}) : super(key: key);

  @override
  _AsistenciaPageState createState() => _AsistenciaPageState();
}

class _AsistenciaPageState extends State<AsistenciaPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabCtrl =
        TabController(length: 8, vsync: this, initialIndex: 0);
    return Column(
      children: [
        SizedBox(height: 20),
        Theme(
          data: ThemeData(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
          child: TabBar(
            isScrollable: true,
            physics: BouncingScrollPhysics(),
            controller: tabCtrl,
            labelColor: Colors.white,
            labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelColor: Color(0xff47525E),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Color(0xff243165),
            ),
            onTap: (value) {},
            tabs: <Widget>[
              Tab(
                child: Text("FCNM"),
              ),
              Tab(
                child: Text("FIEC"),
              ),
              Tab(
                child: Text("FADCOM"),
              ),
              Tab(
                child: Text("FCSH"),
              ),
              Tab(
                child: Text("FCV"),
              ),
              Tab(
                child: Text("FIMCP"),
              ),
              Tab(
                child: Text("FICT"),
              ),
              Tab(
                child: Text("FIMCM"),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: TabBarView(
            controller: tabCtrl,
            children: [
              Facultad(),
              Facultad(),
              Facultad(),
              Facultad(),
              Facultad(),
              Facultad(),
              Facultad(),
              Facultad(),
            ],
          ),
        )
      ],
    );
  }
}

class Facultad extends StatelessWidget {
  const Facultad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffE5E9F2),
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          height: 1,
          color: Color(0xff243165),
        ),
        itemCount: 10,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Clase(
            index: index,
          );
        },
      ),
    );
  }
}

class Clase extends StatelessWidget {
  const Clase({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: Colors.white,
      child: ListTile(
        onTap: () {},
        title: Text(
          "Calculo I",
          style: TextStyle(
            color: Color(0xff47525E),
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Límite en un punto",
              style: TextStyle(
                color: Color(0xff47525E),
              ),
            ),
            Text(
              "Axell Concha",
              style: TextStyle(
                color: Color(0xff72777B),
              ),
            ),
          ],
        ),
        trailing: Column(
          children: [
            Icon(
              Icons.star,
              color: Colors.amber[600],
              size: 30,
            ),
            Text(
              "19/05/2021",
              style: TextStyle(
                color: Color(0xff47525E),
                fontSize: 12,
              ),
            )
          ],
        ),
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.blue,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Icon(Icons.person),
          ),
        ),
      ),
    );
  }
}
