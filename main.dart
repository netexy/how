import 'package:flutter/material.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NETEXY',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SF Pro Display Regular',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

       home: MyHomePage(title: 'NETEXY'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  final Page1 page1 = Page1();
  final Page2 page2 = Page2();
  final Page3 page3 = Page3();
  final Page4 page4 = Page4();
  final Page5 page5 = Page5();

  @override
  void initState() {
    super.initState();
  }

  Widget pageChooser(int page) {
    switch (page) {
      case 0:
        return page1;
      case 1:
        return page2;
      case 2:
        return page3;
      case 3:
        return page4;
      case 4:
        return page5;
    }
  }    

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.transparent,
        
      appBar: AppBar(
        title: Text('NETEXY'),
        elevation: 0.0,
        backgroundColor: Color(0xFF000000).withOpacity(0.71),
      ),
        
      body: Stack(
        children: <Widget>[
            
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Color(0xFF9C45D3), Color(0xFF8D8FFE), Color(0xFF0290BC), Color(0xFF03B8DE), Color(0xFF26A0F5), Color(0xFF0290BC), Color(0xFF03B8DE)])),
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(_page.toString(), textScaleFactor: 10.0),
                  RaisedButton(
                    child: Text('Go page index: 1'),
                    onPressed: () {
                      final CurvedNavigationBarState navBarState =
                          _bottomNavigationKey.currentState;
                      navBarState.setPage(1);
                    },
                  )
                ],
              ),
            ),
          ),
            
          Align(
            alignment: Alignment.bottomCenter,
            child: CurvedNavigationBar(
              key: _bottomNavigationKey,
              index: 0,
              height: 50.0,
              items: [
                Icon(Icons.verified, size: 30), 
                Icon(Icons.rate_review, size: 30), 
                Icon(Icons.developer_mode, size: 30), 
                Icon(Icons.extension, size: 30),
                Icon(Icons.article, size: 30), 
              ],
              color: Colors.white,
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 600),
              onTap: (index) {
                setState(() {
                  _page = index;
                });
              },
            ),
          )
            
        ],
      ),
        
      //body: pageChooser(_page),    
    );
  }
}



class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Page1");
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Page2");
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Page3");
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Page4");
  }
}

class Page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Page5");
  }
}