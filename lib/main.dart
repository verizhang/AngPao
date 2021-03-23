import 'package:AngPao/sendPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'sendPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Color red = Color(0xFFBD0008);
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            BackgroundContent(),
            SafeArea(
              child: Column(
                children: [
                  HeadContent(red: red),
                  MainContent(red: red),
                  NavigationContent(red: red)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NavigationContent extends StatelessWidget {
  const NavigationContent({
    Key key,
    @required this.red,
  }) : super(key: key);

  final Color red;

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);

    return Container(
      width: screen.size.width,
      height: screen.size.height * 10 / 100,
      padding: EdgeInsets.all(screen.size.height * 1 / 100),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black12,
          spreadRadius: 0,
          blurRadius: 6,
          offset: Offset(0, -1),
        )
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SendPage()));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screen.size.height * 5 / 100,
                  height: screen.size.height * 5 / 100,
                  padding: EdgeInsets.all(screen.size.height * 1 / 100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: red,
                  ),
                  child: Image.asset('assets/icons/paper-plane.png'),
                ),
                Text(
                  'Kirim',
                  style: TextStyle(
                    color: red,
                    fontSize: 10,
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screen.size.height * 5 / 100,
                height: screen.size.height * 5 / 100,
                padding: EdgeInsets.all(screen.size.height * 1 / 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: red,
                ),
                child: Image.asset('assets/icons/inbox.png'),
              ),
              Text(
                'Terima',
                style: TextStyle(
                  color: red,
                  fontSize: 10,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class BackgroundContent extends StatelessWidget {
  const BackgroundContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 50 / 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/cover.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class HeadContent extends StatelessWidget {
  const HeadContent({
    Key key,
    @required this.red,
  }) : super(key: key);

  final Color red;

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: screen.size.height * 7 / 100,
          width: screen.size.height * 7 / 100,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: red,
          ),
          child: Image.asset(
            'assets/icons/settings.png',
            width: 20,
          ),
        ),
        Container(
          height: screen.size.height * 7 / 100,
          width: screen.size.height * 7 / 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: red,
            image: DecorationImage(
              image: AssetImage('assets/images/user.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: screen.size.height * 7 / 100,
          width: screen.size.height * 7 / 100,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: red,
          ),
          child: Image.asset(
            'assets/icons/bell.png',
            width: 20,
          ),
        ),
      ],
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    Key key,
    @required this.red,
  }) : super(key: key);

  final Color red;

  @override
  Widget build(BuildContext context) {
    double padding = 15.0;
    MediaQueryData screen = MediaQuery.of(context);
    return Container(
      margin: EdgeInsets.only(top: screen.size.height * 21 / 100),
      height: screen.size.height * 62 / 100 - 25,
      width: screen.size.width * 100 / 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(padding),
        child: Column(
          children: [
            Center(
              child: Container(
                width: 50,
                height: 8,
                decoration: BoxDecoration(
                  color: red,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            //Main Content Here
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        height:
                            screen.size.width * 18 / 100 - (padding * 2 / 5),
                        width: screen.size.width * 18 / 100 - (padding * 2 / 5),
                        margin: EdgeInsets.only(
                          left: screen.size.width * 1 / 100,
                          right: screen.size.width * 1 / 100,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: red, width: 3),
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: AssetImage('assets/images/profile1.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        'Joe',
                        style: TextStyle(
                          color: red,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height:
                            screen.size.width * 18 / 100 - (padding * 2 / 5),
                        width: screen.size.width * 18 / 100 - (padding * 2 / 5),
                        margin: EdgeInsets.only(
                          left: screen.size.width * 1 / 100,
                          right: screen.size.width * 1 / 100,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: red, width: 3),
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: AssetImage('assets/images/profile2.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        'Biden',
                        style: TextStyle(
                          color: red,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height:
                            screen.size.width * 18 / 100 - (padding * 2 / 5),
                        width: screen.size.width * 18 / 100 - (padding * 2 / 5),
                        margin: EdgeInsets.only(
                          left: screen.size.width * 1 / 100,
                          right: screen.size.width * 1 / 100,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: red, width: 3),
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: AssetImage('assets/images/profile3.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        'Jane',
                        style: TextStyle(
                          color: red,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height:
                            screen.size.width * 18 / 100 - (padding * 2 / 5),
                        width: screen.size.width * 18 / 100 - (padding * 2 / 5),
                        margin: EdgeInsets.only(
                          left: screen.size.width * 1 / 100,
                          right: screen.size.width * 1 / 100,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: red, width: 3),
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: AssetImage('assets/images/profile4.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        'Toe',
                        style: TextStyle(
                          color: red,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height:
                            screen.size.width * 18 / 100 - (padding * 2 / 5),
                        width: screen.size.width * 18 / 100 - (padding * 2 / 5),
                        margin: EdgeInsets.only(
                          left: screen.size.width * 1 / 100,
                          right: screen.size.width * 1 / 100,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: red, width: 3),
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: AssetImage('assets/images/profile5.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        'Leo',
                        style: TextStyle(
                          color: red,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            Container(
              width: screen.size.width - padding,
              height: screen.size.height * 15 / 100,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(padding),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Saldo AngPao",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Rp. 150.000",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    "Tersedia",
                  ),
                ],
              ),
            ),

            Container(
              width: screen.size.width - padding,
              height: screen.size.height * 19 / 100,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(padding),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Aktifitas Terkini",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Temukan semua informasi pembayaran dengan cepat, tanggapi permintaan pembayaran dari teman, kirim pembayaran, dan banyak lagi",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black45,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 6, bottom: 6),
                    width: screen.size.width - padding,
                    height: 1,
                    color: Colors.black38,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/list-text.png',
                        width: screen.size.width * 6 / 100,
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(left: screen.size.width * 5 / 100),
                        child: Text(
                          "Lihat semua aktifitas",
                          style: TextStyle(color: red),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
