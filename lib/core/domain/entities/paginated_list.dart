class PaginatedList<T> {
  final bool hasMore;
  final List<T> data;

  PaginatedList(
    this.hasMore,
    this.data,
  );
}
