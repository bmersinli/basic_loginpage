// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: "/", routes: {
      "/": (context) => GirisEkrani(),
      "/ProfilSayfasiRotasi": (context) => ProfilEkrani(),
    });
  }
}

class GirisEkrani extends StatefulWidget {
  @override
  _GirisEkraniState createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  girisYap() {
    if (t1.text == "admin" && t2.text == "1234") {
      Navigator.pushNamed(
        context,
        "/ProfilSayfasiRotasi",
        arguments: VeriModeli(kullaniciAdi: t1.text, sifre: t2.text),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Wrong username or password!"),
            content: new Text(
                "The username or password is incorrect, please try again."),
            actions: <Widget>[
              new TextButton(
                child: const Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(100),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Username",
                ),
                controller: t1,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Password",
                ),
                controller: t2,
              ),
              ElevatedButton(
                onPressed: girisYap,
                child: Text("Sign In"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilEkrani extends StatefulWidget {
  var context;

  BuildContext? cikisYap() {
    Navigator.pop(context!);
  }

  @override
  _ProfilEkraniState createState() => _ProfilEkraniState();
}

class _ProfilEkraniState extends State<ProfilEkrani> {
  get cikisYap => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    VeriModeli iletilenArgumanlar =
        ModalRoute.of(context)!.settings.arguments as VeriModeli;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () => cikisYap,
              child: Text("Sign Out"),
            ),
            Text(iletilenArgumanlar.kullaniciAdi),
            Text(iletilenArgumanlar.sifre),
          ],
        ),
      ),
    );
  }
}

class VeriModeli {
  String kullaniciAdi, sifre;
  VeriModeli({required this.kullaniciAdi, required this.sifre});
}
