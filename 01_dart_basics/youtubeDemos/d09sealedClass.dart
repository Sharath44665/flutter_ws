sealed class Result {}

class Success extends Result {
  final String data;
  Success(this.data);
}

class Error extends Result {
  final String message;
  Error(this.message);
}

String handleResult(Result result) {
  return switch (result) {
    Success(data: String s) => "Success: $s",
    Error(message: String msg) => "Error: $msg",
  };
}

void main(List<String> args) {
  Success successMsg = Success("sent");
  Error errorMsg = Error("Something went wrong");
  print(handleResult(successMsg));
  print(handleResult(errorMsg));
}
