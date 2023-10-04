class BasePaginationUseCaseParams {
  int? pageSize;
  int page;

  BasePaginationUseCaseParams({
    this.pageSize,
    this.page = 1,
  });
}
