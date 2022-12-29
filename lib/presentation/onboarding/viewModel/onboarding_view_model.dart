import 'dart:async';

import 'package:first_application/presentation/base/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/models.dart';
import '../../resources/assets_manager.dart';
import '../../resources/string_manager.dart';

class OnboardingViewModel extends BaseViewModel with OnBoardingViewModelInputs,OnBoardingViewModelOutputs{

  int _currentPageIndex = 0;
  //behavior subject instead of stream controller to build the stream many times in hot reload
final StreamController<SliderViewObject> streamController=BehaviorSubject<SliderViewObject>();
  late final List<SliderObject> _list ;


  @override
  void dispose() {
    streamController.close();
  }

  @override
  void start() {
    _list=_getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = ++_currentPageIndex;
    if (nextIndex == _list.length) nextIndex = 0;
    return nextIndex;
  }
@override
  int goPrevious() {
    int previousIndex = --_currentPageIndex;
    if (previousIndex == -1) previousIndex = _list.length - 1;
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
      _currentPageIndex = index;
      _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject => streamController.stream.map((sliderViewObject) => sliderViewObject);
//onboarding private functions
  List<SliderObject> _getSliderData() => [
    SliderObject(AppStrings.onBoardingTitle1, AppStrings.onBoardingSubTitle1,
        ImageAssets.onboarding_logo1),
    SliderObject(AppStrings.onBoardingTitle2, AppStrings.onBoardingSubTitle2,
        ImageAssets.onboarding_logo2),
    SliderObject(AppStrings.onBoardingTitle3, AppStrings.onBoardingSubTitle3,
        ImageAssets.onboarding_logo3),
    SliderObject(AppStrings.onBoardingTitle4, AppStrings.onBoardingSubTitle4,
        ImageAssets.onboarding_logo4),
  ];
 void _postDataToView(){
    inputSliderViewObject.add(SliderViewObject(_list[_currentPageIndex], _list.length, _currentPageIndex));
  }

}
abstract class OnBoardingViewModelInputs{
int goNext();
int goPrevious();
void onPageChanged(int index);
//use get to force onboarding view model to override the sink
 Sink get inputSliderViewObject;
}
abstract class OnBoardingViewModelOutputs{
  Stream<SliderViewObject> get outputSliderViewObject;
}

