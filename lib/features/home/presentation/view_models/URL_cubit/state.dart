
abstract class URL_State {}

class URLinitstate extends URL_State {}

class URLLoadingState extends URL_State {}

class URLSuccessState extends URL_State {

}

class URLFailureState extends URL_State {
  String error;
  URLFailureState({
    required this.error,
  });
}
