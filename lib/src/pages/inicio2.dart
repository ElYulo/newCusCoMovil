import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';


class Inicio2Page extends StatefulWidget {
  Inicio2PageState createState() => Inicio2PageState();
  
}

class Inicio2PageState extends State<Inicio2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 10.0,),
          _titulo(),
          SizedBox(height: 10.0,),
          _clientes(),
          SizedBox(height: 10.0,),
          _grafica()
        ],
      ),
    );
  }

  Widget _titulo(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          color: Color.fromARGB(255, 185, 191, 201),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 100.0, vertical: 15.0),
            child: Text("Bienvenidos", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }

  Widget _clientes(){
    return Column(
      children: [
        Text("Clientes actuales:", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Color.fromARGB(255, 159, 211, 170),
              margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 45),
                    child: Column(
                      children: [
                        SizedBox(height: 15,),
                        Text("Actual", style: TextStyle(fontSize: 35, color: Color.fromARGB(255, 59, 147, 73))),
                        Text("25", style: TextStyle(fontSize: 90, color: Color.fromARGB(255, 59, 147, 73)),),
                        SizedBox(height: 15,),
                      ],
                    ),
                  ),
                  SizedBox(width: 25,),
                  Container(
                    margin: EdgeInsets.only(right: 45),
                    child: Column(
                      children: [
                        SizedBox(height: 15,),
                        Text("Limite", style: TextStyle(fontSize: 35, color: Color.fromARGB(255, 207, 25, 42))),
                        Text("30", style: TextStyle(fontSize: 90, color: Color.fromARGB(255, 207, 25, 42))),
                        SizedBox(height: 15,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _grafica(){
    Map<String, double> hora = {
      "08 - 09 hrs": 5,
      "09 - 10 hrs": 3,
      "10 - 11 hrs": 2,
      "11 - 12 hrs": 2,
      "12 - 13 hrs": 6,
      "13 - 14 hrs": 8,
      "14 - 15 hrs": 9
    };
    return Column(
      children: [
        Text("Estadisticas:", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        Row(
          children: [
            SizedBox(width: 15.0),
            Text("- Por semana y hora"),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Container(
            height: 210,
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(width: 10.0,),
                PieChart(
                  dataMap: hora,
                  chartType: ChartType.ring,
                  chartRadius: 180,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}