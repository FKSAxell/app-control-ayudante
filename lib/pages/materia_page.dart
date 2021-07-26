import 'package:app_control_ayudante/helpers/sliver_persisten_header.dart';
import 'package:flutter/material.dart';

class MateriaPage extends StatefulWidget {
  const MateriaPage({Key? key}) : super(key: key);

  @override
  State<MateriaPage> createState() => _MateriaPageState();
}

class _MateriaPageState extends State<MateriaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E9F2),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Color(0xff243165),
            backwardsCompatibility: true,
            elevation: 0,
            pinned: true,
            expandedHeight: 160.0,
            actions: [
              IconButton(
                  onPressed: () => {}, icon: Icon(Icons.star_border_rounded))
            ],
            flexibleSpace: const FlexibleSpaceBar(
              title: Text(
                'Fundamentos de Programación',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegate(
              minHeight: 120,
              maxHeight: 120,
              child: Container(
                color: Color(0xff243165),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: TopAyudante(
                        imagen:
                            Image(image: AssetImage("assets/test/axell.jpg")),
                        nombre: "Axell C.",
                        calificacion: "4.9",
                        color: Color(0xffbfc1c1),
                        radius: 25,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: TopAyudante(
                        imagen:
                            Image(image: AssetImage("assets/test/axell.jpg")),
                        nombre: "Zarinna A.",
                        calificacion: "5.0",
                        color: Color(0xffffbf00),
                        radius: 25,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: TopAyudante(
                        imagen:
                            Image(image: AssetImage("assets/test/axell.jpg")),
                        nombre: "David Py",
                        calificacion: "4.8",
                        color: Color(0xff9c5221),
                        radius: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  onTap: () {},
                  title: Text(
                    "Axell Concha",
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
                    "8:30",
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
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class TopAyudante extends StatelessWidget {
  const TopAyudante({
    Key? key,
    required this.imagen,
    required this.nombre,
    required this.calificacion,
    required this.color,
    required this.radius,
  }) : super(key: key);
  final Widget imagen;
  final String nombre;
  final String calificacion;
  final Color color;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                spreadRadius: 2,
                offset: Offset(0, 0),
                color: this.color,
              )
            ],
          ),
          child: CircleAvatar(
            radius: this.radius,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: this.imagen,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          this.nombre,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              size: 20,
              color: this.color,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              this.calificacion,
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        )
      ],
    );
  }
}

class TopAyudantes extends StatelessWidget {
  const TopAyudantes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 80,
        child: PageView.builder(
          itemCount: 5,
          controller: PageController(
            viewportFraction: 0.8,
          ),
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.only(right: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: Offset(1, 1),
                ),
              ],
            ),
            child: ListTile(
              onTap: () {},
              title: Text(
                "Axell Concha",
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
                "8:30",
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
          ),
        ),
      ),
    );
  }
}
