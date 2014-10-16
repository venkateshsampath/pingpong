library pong;

import 'package:start/start.dart';

final PORT = 8080; // Port number for the pong server

void startPongServer() {
  var answers = {};

  start(host: "0.0.0.0", port: PORT).then((app) {
    app.get("/pong/:length").listen((req) {
      int len = int.parse(req.param('length'));
      final answer = answers[len] != null ? answers[len] : answers[len] = "p".padRight(len - 2, "o") + "ng";
      req.response.status(200);
      req.response.send(answer);
    });

    print("Pong-Server is up and running, listening on port $PORT");

  });  
}

/**
 * Entrypoint to start the pong answer server without docker.
 */
void main() => startPongServer();