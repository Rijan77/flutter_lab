Stream<String> fetchDataStream() async* {
  for (int i = 1; i <= 3; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield "Data $i"; // Yield sends a value to the stream
  }
}

void main() {
  print("Listening to stream...");
  fetchDataStream().listen((data) {
    print(data);
  });
  print("This prints immediately!");
}