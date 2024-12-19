library api_response;

///Base API response
abstract class APIResponse<R, F> {
  void fold(
    void Function(R data) onSuccess,
    void Function(F failure) onError,
  );
}

class FailureResponse<R, F> extends APIResponse<R, F> {
  final F failure;

  FailureResponse({
    required this.failure,
  });

  @override
  void fold(
    void Function(R data) onSuccess,
    void Function(F failure) onError,
  ) {
    onError(failure);
  }
}

class SuccessResponse<R, F> extends APIResponse<R, F> {
  final R data;

  SuccessResponse({
    required this.data,
  });

  @override
  void fold(
    void Function(R data) onSuccess,
    void Function(F failure) onError,
  ) {
    onSuccess(data);
  }
}
