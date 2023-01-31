import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  void _onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    String judul;
    if (selectedIndex == 0) {
      judul = 'Halaman Awal';
    } else if (selectedIndex == 1) {
      judul = 'Halaman 2';
    } else if (selectedIndex == 2) {
      judul = 'Halaman 3';
    } else {
      judul = 'Halaman 4';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(judul),
      ),
      body: Container(child: LayoutBuilder(builder: (context, constraints) {
        if (selectedIndex == 0) {
          return Column(
            children: <Widget>[
              Flexible(
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        //child: Text("Halaman Home"),
                        child: const Image(
                          image: NetworkImage(
                              'https://www.dbl.id/uploads/school/7987/437-SMAN_8_BEKASI.png'),
                          fit: BoxFit.fill,
                        ),
                        color: Colors.red,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        //child: Text("Halaman Home"),
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.center,
                        color: Color.fromARGB(255, 54, 244, 114),
                        child: Column(children: [
                          Icon(
                            Icons.print,
                            size: 80,
                            color: Colors.red,
                          ),
                        ]),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        //child: Text("Halaman Home"),
                        child:
                            new LayoutBuilder(builder: (context, constraint) {
                          return new Icon(Icons.access_alarms,
                              size: constraint.biggest.width);
                        }),
                        color: Color.fromARGB(255, 70, 81, 195),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Column(children: [
                  Expanded(
                    child: CarouselSlider(
                      items: imageSliders,
                      carouselController: _controller,
                      options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 2.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                ]),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  //child: Text("Halaman Home3"),
                  color: Colors.yellow,
                ),
              ),
            ],
          );
        } else if (selectedIndex == 1) {
          return Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        //child: Text("Halaman Home"),
                        color: Color.fromARGB(255, 205, 231, 206),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        //child: Text("Halaman Home"),
                        color: Color.fromARGB(255, 163, 58, 78),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        //child: Text("Halaman Home"),
                        color: Color.fromARGB(255, 24, 226, 30),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  //child: Text("Halaman Home2"),
                  color: Colors.blue,
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  //child: Text("Halaman Home3"),
                  color: Colors.black,
                ),
              ),
            ],
          );
        } else if (selectedIndex == 2) {
          return Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  //child: Text("Halaman Home"),
                  color: Color.fromARGB(255, 178, 138, 135),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  //child: Text("Halaman Home2"),
                  color: Color.fromARGB(255, 92, 222, 98),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  //child: Text("Halaman Home3"),
                  color: Color.fromARGB(255, 235, 71, 197),
                ),
              ),
            ],
          );
        } else {
          return Text("Ini Halaman Empat");
        }
      })),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        currentIndex: selectedIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Pengaturan'),
        ],
      ),
    );
  }
}
