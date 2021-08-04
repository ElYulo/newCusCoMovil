import 'package:flutter/material.dart';

class SobreCuscoPage extends StatefulWidget {
  SobreCuscoPageState createState() => SobreCuscoPageState();
}

class SobreCuscoPageState extends State<SobreCuscoPage> {
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
              _titulo()
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                child: _informacion()
              )
            ],
          ),
          Container(
            child: _img()
          ),
          SizedBox(height: 20.0,)
        ],
      ),
    );
  }

  Widget _img(){
    return Stack(
      children: [
        Positioned(
          bottom: 1,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 159, 211, 170),
              borderRadius: BorderRadius.circular(200.0)
            ),
          ),
        ),
        Positioned(
          bottom: -1,
          left: 90,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 159, 211, 170),
              borderRadius: BorderRadius.circular(200.0)
            ),
          ),
        ),
        Positioned(
          bottom: -3,
          left: 220,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 159, 211, 170),
              borderRadius: BorderRadius.circular(200.0)
            ),
          ),
        ),
        Image.asset('assets/estu.png'),
      ],
    );
  }

  Widget _informacion(){
    return Card(
      color: Color.fromARGB(255, 220, 229, 246),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Text("At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."),
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
              " Sobre Cusco ", 
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