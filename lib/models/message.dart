import 'package:mobx/mobx.dart';
part 'message.g.dart';

class Message = _MessageBase with _$Message;

abstract class _MessageBase with Store {

  _MessageBase(this.title, this.id);

  @observable
  String title;
  @action
  setTitle(String newTitle) => title = newTitle;

  @observable
  String id;
  @action
  setId(String newId) => id = newId;

}