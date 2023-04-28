part of 'form_bloc.dart';

@immutable
class FormjonState {
  final Status status;
  final RegionModel region;
  final DistrictModel district;

  const FormjonState({
    this.status = Status.initial,
    required this.region,
    required this.district,
  });

  FormjonState copyWith({
    Status? status,
    RegionModel? region,
    DistrictModel? district,
  }) {
    return FormjonState(
      status: status ?? this.status,
      region: region ?? this.region,
      district: district ?? this.district,
    );
  }
}

enum Status { initial, loading, success, fail }
