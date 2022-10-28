import 'package:examen_calendari/editar_esdeveniment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:examen_calendari/controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => MyHomePage(
    title: "Calendario de Ángel Espinosa",
    ),
        '/event': (context) => EditarEsdevenimentForm(),
      },
      onGenerateRoute: (routeSettings) {
        switch(routeSettings.name) {
          case '/event':
            return MaterialPageRoute(builder: (context)=>EditarEsdevenimentForm(index: (routeSettings.arguments as Map)["index"]));
        }
      },
    );
  }
}

class Esdeveniment {
  final DateTime horaInici, horaFinal;
  final String titol;
  final String? descripcio;

  Esdeveniment(
      {required this.horaInici,
      required this.horaFinal,
      required this.titol,
      this.descripcio});
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final esdeveniments = eventController.esdeveniments;

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
          LlistatEsdevenimentsWidget(llistaEsdeveniments: widget.esdeveniments),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/event');
        },
        tooltip: 'Afegir esdeveniment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class LlistatEsdevenimentsWidget extends StatelessWidget {
  const LlistatEsdevenimentsWidget({
    Key? key,
    required this.llistaEsdeveniments,
  }) : super(key: key);

  final List<Esdeveniment> llistaEsdeveniments;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        for (Esdeveniment lEsdeveniment in llistaEsdeveniments)
          EsdevenimentWidget(lEsdeveniment)
      ],
    );
  }
}

class EsdevenimentWidget extends StatelessWidget {
  const EsdevenimentWidget(
    this.esdeveniment, {
    Key? key,
  }) : super(key: key);

  final Esdeveniment esdeveniment;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
          "${DateFormat("yyyy-MM-dd HH:mm").format(esdeveniment.horaInici)}: ${esdeveniment.titol}\n${esdeveniment.descripcio}"),
      onTap: () async {
        await Navigator.pushNamed(context, "/clase/edit",
            arguments: {"index": eventController.getindex(esdeveniment)});
      },
    );
  }
}
