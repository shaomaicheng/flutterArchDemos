import 'package:mobx/mobx.dart';
part 'counter_mobx.g.dart';

class MCounter  = MCounterBase with _$MCounter;

abstract class MCounterBase with Store {
  @observable
  int counter = 0;

  @action
  void incream(){
    counter += 1;
  }
}