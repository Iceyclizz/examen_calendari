import 'package:examen_calendari/main.dart';
import 'package:examen_calendari/model.dart';

class eventController{
  DateTime? _horaInici, _horaFinal;
  String? _titol;
  String? _descripcio;

  static List<Esdeveniment> get esdeveniments => EsdevenimentsModel.esdeveniments!;
  static set esdeveniments(List<Esdeveniment> value) {
    EsdevenimentsModel.esdeveniments = value;
  }
  static void addEvent(Esdeveniment e){
    EsdevenimentsModel().addEvent(e);
  }
  static void popEvent(Esdeveniment e){
    EsdevenimentsModel().popEvent(e);
  }
  static getindex(Esdeveniment e){
    return EsdevenimentsModel.esdeveniments.indexOf(e);
  }
  void save({int? index}){
  if (index == null){
  addEvent(Esdeveniment(titol: _titol!,descripcio: _descripcio, horaInici: _horaInici!, horaFinal: _horaFinal!));
  }else{
    EsdevenimentsModel.esdeveniments[index] = Esdeveniment(titol: _titol!,descripcio: _descripcio, horaInici: _horaInici!, horaFinal: _horaFinal!);
  }
  }
}