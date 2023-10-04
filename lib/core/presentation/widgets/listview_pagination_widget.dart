import 'package:al_takamul_alteqani_test/core/presentation/cubits/base_states/base_paginated_list_state.dart';
import 'package:al_takamul_alteqani_test/core/presentation/cubits/cubits/pagination_cubit/pagination_cubit.dart';
import 'package:al_takamul_alteqani_test/core/presentation/cubits/cubits/pagination_cubit/pagination_cubit_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:al_takamul_alteqani_test/core/presentation/utils/generated/translation/translations.dart';
import 'package:al_takamul_alteqani_test/core/presentation/widgets/error_view.dart';
import 'package:al_takamul_alteqani_test/core/presentation/widgets/loader.dart';

class ListViewPaginationWidget<T> extends StatefulWidget {
  final PaginationCubit paginationCubit;
  final PaginationParams? params;
  final Widget Function(T) itemBuilder;
  final Axis scrollDirection;
  final double height;

  const ListViewPaginationWidget({
    Key? key,
    required this.paginationCubit,
    this.params,
    required this.itemBuilder,
    this.scrollDirection = Axis.vertical,
    this.height = 100.0,
  }) : super(key: key);

  @override
  State<ListViewPaginationWidget<T>> createState() =>
      _ListViewPaginationWidgetState<T>();
}

class _ListViewPaginationWidgetState<T>
    extends State<ListViewPaginationWidget<T>> {
  bool allowToScroll = true;

  @override
  void initState() {
    if (widget.paginationCubit.state.items.isEmpty) {
      widget.paginationCubit.get(params: widget.params);
    }

    super.initState();
  }

  @override
  void didUpdateWidget(ListViewPaginationWidget<T> oldWidget) {
    if (widget.params != null) {
      if (widget.params != oldWidget.params) {
        widget.paginationCubit.get(
          params: widget.params,
        );
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginationCubit, BasePaginatedListState>(
        bloc: widget.paginationCubit,
        builder: (context, state) {
          if ((state.status == PaginatedListStatus.inProgress)) {
            return const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Loader(),
            );
          } else if ((state.status == PaginatedListStatus.failure)) {
            return Center(
              child: ErrorView(
                failure: state.failure,
                onRetry: () {
                  if (state.status == PaginatedListStatus.failure) {
                    widget.paginationCubit.get(
                      params: widget.params == null ? widget.params : null,
                    );
                  } else {
                    widget.paginationCubit.paginate();
                  }
                },
              ),
            );
          }
          if (state.items.isEmpty) {
            return Center(child: Text(Translations.of(context)!.noData));
          }
          return RefreshIndicator(
            onRefresh: () async {
              widget.paginationCubit.get(params: widget.params);
            },
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is UserScrollNotification) {
                  if (notification.direction == ScrollDirection.forward) {
                    allowToScroll = false;
                  }
                  if (notification.direction == ScrollDirection.idle) {
                    allowToScroll = true;
                  }
                  if (notification.direction == ScrollDirection.reverse) {}
                  if (notification.direction == ScrollDirection.reverse &&
                      allowToScroll) {
                    double maxScroll = notification.metrics.maxScrollExtent;
                    double currentScroll = notification.metrics.pixels;
                    double delta = 150.0;
                    if (maxScroll - currentScroll <= delta) {
                      if (!widget.paginationCubit.state.hasReachedMax) {
                        widget.paginationCubit.paginate();
                      }
                    }
                  }
                }
                return false;
              },
              child: SizedBox(
                height: widget.scrollDirection == Axis.vertical
                    ? null
                    : widget.height.toDouble(),
                child: CustomScrollView(
                  scrollDirection: widget.scrollDirection,
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (_, int index) =>
                            widget.itemBuilder(state.items[index]),
                        childCount: state.items.length,
                      ),
                    ),
                    if (widget.paginationCubit.state.status ==
                        PaginatedListStatus.paginateInProgress)
                      const SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Loader(),
                        ),
                      ),
                    if (state.status == PaginatedListStatus.paginateFailure)
                      SliverToBoxAdapter(
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.all(8),
                          child: ErrorView(
                            failure: state.failure,
                            onRetry: () {
                              widget.paginationCubit.paginate();
                            },
                          ),
                        ),
                      ),
                    const SliverToBoxAdapter(child: SizedBox(height: 16)),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
