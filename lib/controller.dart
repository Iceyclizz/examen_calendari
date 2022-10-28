import 'package:examen_calendari/main.dart';
import 'package:examen_calendari/model.dart';

class eventController{
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
  void save(int index : null){
  if (index == null){
  addEvent(Esdeveniment(titol: _titol,descripcio: _descripcio, horaInici: _horaInici, horaFinal: _horaFinal))
  }else{

  }
  }
}