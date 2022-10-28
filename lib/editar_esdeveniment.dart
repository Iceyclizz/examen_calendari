import 'package:flutter/material.dart';
import 'controller.dart';

class EditarEsdevenimentForm extends StatefulWidget {
  const EditarEsdevenimentForm({Key? key}) : super(key: key);

  @override
  State<EditarEsdevenimentForm> createState() => _EditarEsdevenimentFormState();
}

class _EditarEsdevenimentFormState extends State<EditarEsdevenimentForm> {

  final _clauFormulari=GlobalKey<FormState>();
  final _controller = eventController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calendario de Ángel Espinosa"),),
      body: Column(
        children: [
          Row(children: [
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Data inici"
                ),
              ),
            ),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "Data fi"
                ),
              ),
            )
          ],
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Títol"
            ),
            validator: (valor) {
              if (valor == null || valor == "") {
                return "Has de posar el titol del event";
              }
            },
          ),
          Expanded(
            child: TextFormField(
              maxLines: null,
              expands: true,
              decoration: const InputDecoration(
                labelText: "Descripció",
                alignLabelWithHint: true,
              ),
            ),
          )
        ],
      ),
          floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_clauFormulari.currentState != null &&
                _clauFormulari.currentState!.validate()) {
              _clauFormulari.currentState!.save();
              Navigator.pop(context);
            }
    },
    tooltip: 'Guardar',
    child: const Icon(Icons.save),
    ));
  }
}
