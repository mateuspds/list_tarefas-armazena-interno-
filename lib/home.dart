import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  TextEditingController _controllerCampo = TextEditingController();
  String f = 'nada salvo';

  _salvar()async{
    final prefis = await SharedPreferences.getInstance();
    String valor = _controllerCampo.text;
    await  prefis.setString('nomes', valor);
    print(prefis);
     

  }

  _recuperar()async{
    final prefis = await SharedPreferences.getInstance();
    setState(() {
      f =  prefis.get('nomes');
    });

  }
  _remover() async{
    final prefis = await SharedPreferences.getInstance();
    prefis.remove('nomes');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulação de dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Text(
                f,
                style: TextStyle(
                    fontSize: 20
                ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Digite algo"
              ),
              controller: _controllerCampo,
            ),
            Padding(padding: EdgeInsets.all(20    )),
            Row(
              children: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                      "Salvar",
                      style: TextStyle(
                          fontSize: 20
                      )
                  ),
                  onPressed: _salvar,
                ),
                //
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                      "Recuperar",
                      style: TextStyle(
                          fontSize: 20
                      )
                  ),
                  onPressed: _recuperar,
                ),
                //
                 RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                      "Remover",
                      style: TextStyle(
                          fontSize: 20
                      )
                  ),
                  onPressed: _remover,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}