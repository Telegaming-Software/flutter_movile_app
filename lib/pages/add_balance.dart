import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tg_softwareapp/widgets/drawer_user.dart';


class AddBalancePage extends StatefulWidget {
  const AddBalancePage({Key? key}) : super(key: key);

  @override
  State<AddBalancePage> createState() => _AddBalancePageState();
}


class _AddBalancePageState extends State<AddBalancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerUser(),
        backgroundColor: const Color.fromRGBO(210, 209, 227, 1),
        appBar: AppBar(
            backgroundColor: const Color.fromRGBO(20, 31, 106, 1),
          ),
        body: ListView(
          children:[
            Column(


            children: [
              const SizedBox(height: 15),

              Container(
                padding:const EdgeInsets.symmetric(horizontal: 15, vertical: 15),

                child: const Text(
                  'Añade tu balance',
                  style: TextStyle(
                      color: Color.fromRGBO(20, 31, 106, 1),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),


              ),
              Image.asset(
                'assets/logo.png',
                width: 200,
              ),
              const SizedBox(height: 15),
              const Text('Monto a Agregar',
                  style: TextStyle(
                      fontSize: 15,
                    color: Color.fromRGBO(121, 128, 148, 100))),
              const SizedBox(height: 15),
              _addMont(),

              const Text('Número de tarjeta',
                  style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(121, 128, 148, 100))),
              const SizedBox(height: 15),
              _addCard(),

              const Text('CCC',
                  style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(121, 128, 148, 100))),
              const SizedBox(height: 15),
              _ccc(),

              const Text('FV',
                  style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(121, 128, 148, 100))),
              const SizedBox(height: 15),
              _expiredDate(),

              const Text('Card holder',
                  style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(121, 128, 148, 100))),

              const SizedBox(height: 15),
              _cardHolder(),

            ],
          ),
          ]
        ),

    );
  }
}

Widget _addMont() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        width: 350,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: Colors.white)),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          cursorColor: Colors.black,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: 'Monto',
            border: InputBorder.none,
          ),
          onChanged: (value) {},
        ),
      );
    },
  );
}

Widget _addCard() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        width: 350,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: Colors.white)),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          cursorColor: Colors.black,
          keyboardType: TextInputType.numberWithOptions(
              signed: false, decimal: true
          ),
          decoration: const InputDecoration(
            hintText: 'Numero de tarjeta',
            border: InputBorder.none,
          ),
          onChanged: (value) {},
        ),
      );
    },
  );
}
Widget _ccc() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: Colors.white)),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          cursorColor: Colors.black,
          keyboardType: TextInputType.numberWithOptions(
              signed: false,decimal: false
          ),

          decoration: const InputDecoration(
            hintText: 'ccc',
            border: InputBorder.none,
          ),
          onChanged: (value) {},
        ),
      );
    },
  );
}
Widget _expiredDate() {
  return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Colors.white)),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        cursorColor: Colors.black,
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
          hintText: 'FV',
          border: InputBorder.none,
        ),
        onChanged: (value) {},
      ),
    );
    },
  );
}

Widget _cardHolder() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        width: 350,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: Colors.white)),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          cursorColor: Colors.black,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            hintText: 'Card Holder',
            border: InputBorder.none,
          ),
          onChanged: (value) {},
        ),
      );
    },
  );
}

