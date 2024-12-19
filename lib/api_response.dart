library api_response;

///Base API response
abstract class APIResponse<R, F> {
  B fold<B>(
    B Function(R data) onSuccess,
    B Function(F failure) onError,
  );
}

class FailureResponse<R, F> extends APIResponse<R, F> {
  final F failure;

  FailureResponse({
    required this.failure,
  });

  @override
  B fold<B>(
    B Function(R data) onSuccess,
    B Function(F failure) onError,
  ) {
    return onError(failure);
  }
}

class SuccessResponse<R, F> extends APIResponse<R, F> {
  final R data;

  SuccessResponse({
    required this.data,
  });

  @override
  B fold<B>(
    B Function(R data) onSuccess,
    B Function(F failure) onError,
  ) {
    return onSuccess(data);
  }
}
