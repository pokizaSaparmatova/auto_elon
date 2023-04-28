import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dars12/core/api/form_api.dart';
import 'package:dars12/core/models/distict_model.dart';
import 'package:dars12/core/models/region_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'form_event.dart';

part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormjonState> {
  FormBloc()
      : super(FormjonState(
          region: RegionModel.empty(),
          district: DistrictModel.empty(),
        )) {
    on<FormChangedEvent>((event, emit) async {
      emit(state.copyWith(
        region: event.region,
        district: event.district,
      ));
      if (event.region != null && state.region.id != event.region?.id) {
        emit(state.copyWith(district: DistrictModel.empty()));
      }
    });
  }
}
