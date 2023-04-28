part of 'form_bloc.dart';

@immutable
abstract class FormEvent {}

class FormChangedEvent extends FormEvent {
  final RegionModel? region;
  final DistrictModel? district;

  FormChangedEvent({this.region, this.district});
}

// class FormDistrictsEvent extends FormEvent {
//   final int regionId;
//
//   FormDistrictsEvent(this.regionId);
// }
//
// class FormBrandsEvent extends FormEvent {}
//
// class FormModelsEvent extends FormEvent {
//   final int brandId;
//
//   FormModelsEvent(this.brandId);
// }
