class BasePaginationParams {
  final int? page;
  final int? pageSize;

  BasePaginationParams({
    this.page,
    this.pageSize,
  });
}

class PaginationParams extends BasePaginationParams {

  PaginationParams({
     int? page,
     int? pageSize,
  }) : super(
          page: page,
          pageSize:  pageSize,
        );

  PaginationParams copyWith({String? searchString}) => PaginationParams(
    page: page,
    pageSize:  pageSize,
      );


}
