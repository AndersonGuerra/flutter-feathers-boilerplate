import 'package:adhara_test/utils/socket.dart';
import 'package:adhara_test/utils/storage.dart';

class Auth {
  static login({String email, String password, isJwt: false}) async {
    if (await Connector.socket.isConnected()) {
      List<dynamic> userAux;
      if (isJwt) {
        String accessToken = await readToken();
        print(accessToken);
        userAux = await Connector.socket.emitWithAck("create", ["authentication", {
          "strategy": "jwt",
          "accessToken": accessToken
        }]);
      } else {
        userAux = await Connector.socket.emitWithAck("create", ["authentication", {
          "strategy": "local",
          "email": email,
          "password": password
        }]);
      }
      if (userAux[0]["accessToken"] != null){
        Connector.user.value = userAux[0];
        await writeToken(Connector.user.value["accessToken"]);
      }
    }
  }
}