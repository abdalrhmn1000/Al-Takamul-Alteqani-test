import 'package:al_takamul_alteqani_test/core/presentation/cubits/base_states/base_paginated_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class PaginationCubit<T, Params>
    extends Cubit<BasePaginatedListState<T>> {
  PaginationCubit(super.initialState);
  void get({Params? params});
  void paginate();
}
