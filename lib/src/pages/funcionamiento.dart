import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class FuncionamientoPage extends StatefulWidget{
  FuncionamientoPageState createState() => FuncionamientoPageState();
}

class FuncionamientoPageState extends State<FuncionamientoPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 182, 200, 236),
        centerTitle: true,
        title: Text("CusCO", style: TextStyle( color: Color.fromARGB(255, 19, 57, 121)),),
        actions: [
          Image.asset('assets/cusco.png', scale: 30.0,),
          SizedBox(width: 15.0,)
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _titulo(),
            ],
          ),
          SizedBox(height: 20.0,),
          _img1(),
          _img2(),
          _img3(),
          _img4()
        ],
      ),
    );
  }

  Widget _img1(){
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      front: Card(
        color: Color.fromARGB(255, 183, 238, 250),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Column(
            children: [
              Image.asset('assets/raspberry.png', scale: 12.7,),
              Text("Raspberry",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0
                ),
              ),
              SizedBox(height: 10.0,),
              Icon(Icons.arrow_drop_down_circle, color: Colors.white, size: 40.0,)
            ],
          ),
        ),
      ),
      back: Card(
        color: Color.fromARGB(255, 183, 238, 250),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
        ),
      ),
    );
  }

  Widget _img2(){
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      front: Card(
        color: Color.fromARGB(255, 182, 200, 236),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Column(
            children: [
              Image.asset('assets/sensor.png', scale: 12.7,),
              Text("Sensores infrarojos",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0
                ),
              ),
              SizedBox(height: 10.0,),
              Icon(Icons.arrow_drop_down_circle, color: Colors.white, size: 40.0,)
            ],
          ),
        ),
      ),
      back: Card(
        color: Color.fromARGB(255, 182, 200, 236),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
        ),
      ),
    );
  }

  Widget _img3(){
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      front: Card(
        color: Color.fromARGB(255, 183, 238, 250),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Column(
            children: [
              Image.asset('assets/display.png', scale: 2.7,),
              Text("Display",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0
                ),
              ),
              SizedBox(height: 10.0,),
              Icon(Icons.arrow_drop_down_circle, color: Colors.white, size: 40.0,)
            ],
          ),
        ),
      ),
      back: Card(
        color: Color.fromARGB(255, 183, 238, 250),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
        ),
      ),
    );
  }

  Widget _img4(){
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      front: Card(
        color: Color.fromARGB(255, 182, 200, 236),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Column(
            children: [
              Image.asset('assets/mongoDB.png', scale: 2.7,),
              Text(
                "MongoDB", 
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0
                ),
              ),
              SizedBox(height: 10.0,),
              Icon(Icons.arrow_drop_down_circle, color: Colors.white, size: 40.0,)
            ],
          ),
        ),
      ),
      back: Card(
        color: Color.fromARGB(255, 182, 200, 236),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."), 
        ),
      ),
    );
  }

  Widget _titulo(){
    return Card(
      color: Color.fromARGB(255, 159, 211, 170),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Row(
          children: [
            Text(
              "¿Cómo funciona?", 
              style: TextStyle(
                color: Color.fromARGB(255, 19, 57, 121), 
                fontWeight: FontWeight.bold,
                fontSize: 25.0
              ),
            )
          ],
        ),
      ),
    );
  }
}