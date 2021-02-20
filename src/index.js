const http = require("http");
const path = require("path");
const static = require("node-static");

const file = new static.Server(path.resolve("public"));

function requestHandler(req, res) {
  file.serve(req, res);
  if (req.url == "/blah") {
    res.end("here is your blah mister !");
  }
}
const server = http.createServer(requestHandler);
const port = process.env.PORT || 3000;

server.listen(port);

server.on("listening", function () {
  console.log(`Listening on port ${port}`);
});
