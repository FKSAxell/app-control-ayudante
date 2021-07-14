import 'package:flutter/material.dart';

class HorarioPage extends StatefulWidget {
  @override
  _HorarioPageState createState() => _HorarioPageState();
}

class _HorarioPageState extends State<HorarioPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabCtrl =
        TabController(length: 7, vsync: this, initialIndex: 0);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Text(
                "Julio",
                style: TextStyle(
                  color: Color(0xff47525E),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
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
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    color: Color(0xff243165),
                  ),
                  tabs: <Widget>[
                    Tab(
                      child: Text("01"),
                      icon: Text("Lun"),
                    ),
                    Tab(
                      child: Text("02"),
                      icon: Text("Mar"),
                    ),
                    Tab(
                      child: Text("03"),
                      icon: Text("Mie"),
                    ),
                    Tab(
                      child: Text("04"),
                      icon: Text("Juv"),
                    ),
                    Tab(
                      child: Text("05"),
                      icon: Text("Vie"),
                    ),
                    Tab(
                      child: Text("06"),
                      icon: Text("Sab"),
                    ),
                    Tab(
                      child: Text("07"),
                      icon: Text("Dog"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabCtrl,
            children: [
              Dia(),
              Dia(),
              Dia(),
              Dia(),
              Dia(),
              Dia(),
              Dia(),
            ],
          ),
        )
      ],
    );
  }
}

class Dia extends StatelessWidget {
  const Dia({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffE5E9F2),
      child: ListView.builder(
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
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
        onTap: () {},
        title: Text(
          "Fundamentos de Programación",
          style: TextStyle(
            color: Color(0xff47525E),
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "Axell Concha",
          style: TextStyle(
            color: Color(0xff72777B),
          ),
        ),
        trailing: Text(
          "${index + 8}:30",
          style: TextStyle(
            color: Color(0xff47525E),
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.yellow,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image(image: AssetImage("assets/test/axell.jpg")),
          ),
        ),
      ),
    );
  }
}
