class SliderModel{

  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath,this.title,this.desc});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }

  String getImageAssetPath(){
    return imageAssetPath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }

}


List<SliderModel> getSlides(){

  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("Lorem ipsum dolor sit amet, consectetur adipiscing elit ut ");
  sliderModel.setTitle("Welcome to Todo Assistance");
  sliderModel.setImageAssetPath("asset/images/onboard1.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("Lorem ipsum dolor sit amet, consectetur adipiscing elit ut ");
  sliderModel.setTitle("Keep Track");
  sliderModel.setImageAssetPath("asset/images/onboard2.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("Lorem ipsum dolor sit amet, consectetur adipiscing elit ut ");
  sliderModel.setTitle("Automatically organize");
  sliderModel.setImageAssetPath("asset/images/onboard3.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();


  return slides;
}