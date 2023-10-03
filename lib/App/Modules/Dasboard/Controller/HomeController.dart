
import 'package:get/get.dart';

class HomeController extends GetxController {


  int pageNumberVal = 1, pageSizeValue = 10;
  bool noDataFound = false, isLoadin = false;
  String ProfileIMG =
      "https://www.masslive.com/resizer/kNl3qvErgJ3B0Cu-WSBWFYc1B8Q=/arc-anglerfish-arc2-prod-advancelocal/public/W5HI6Y4DINDTNP76R6CLA5IWRU.jpeg";

  String MobileIMG = "https://www.freepnglogos.com/uploads/mobile-png/mobile-phone-icons-icon-7.png";
  String FortuneOil = "https://pngfile.net/download/xGLCdZVvh05lajvTnGj74uI6Mx8JcsmqILf4ff6g4sd8151NlF0gZEqWwKRkt7IrXdEFClevmjCXjPuXt65SCnfZfICz90fApFuFMa21AHPH4v4HffzDzWp4m7UhnWPESa7fgPh8PPrQPnzdewtTQp4dY1tFkgtO09sYppD2f6ueu89dfyYZgGzGuvSElkCOJ4w3imPr/medium";
  String offf = "https://cdn-icons-png.flaticon.com/128/10770/10770727.png";
  String model1 = "https://5.imimg.com/data5/XO/AE/MY-39077357/mens-check-shirts.jpg";
  String shoues1 = "https://m.media-amazon.com/images/I/71bSH5X7hrL._AC_UF894,1000_QL80_.jpg";


  RxList BCImg = [
  "https://www.cnet.com/a/img/resize/71701e7c6d9b94a8ec44c4e9610106a49c05e468/hub/2022/12/16/eb02a6aa-f331-4fbe-9e5f-35efd2198f8d/p1002240-1.jpg?auto=webp&fit=crop&height=900&width=1200",
  "https://rukminim2.flixcart.com/image/832/832/xif0q/trouser/y/m/z/-original-imags7jvrkxnfege.jpeg?q=70",
  "https://media.istockphoto.com/id/1130447045/photo/multi-colored-toothbrushes-in-a-glass-cup-blue-background.jpg?s=612x612&w=0&k=20&c=vvPdOtZ-3YT98tMh5NChE1Ljn1Xdfu9Jxdk4qY26zgE=",
  "https://www.macworld.com/wp-content/uploads/2023/01/13inch-macbook-pro-m2-013-2.jpg?quality=50&strip=all",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqubnmONj2xaXaTMXmf-0jQ3yDuEIHNPgqqQ&usqp=CAU",
    "https://blog.ipleaders.in/wp-content/uploads/2019/10/GEN-Sports.png"
  ].obs;
  RxList BCTittle = [
    "Smart Phone",
    "Top Fashion",
    "Personal Car",
    "Laptop & Tablet",
    "Smart Watches",
    "Sport Accessories"
  ].obs;




  final panditImage = "".obs;

  RxList bannerUrlLList = [
    "https://freepngimg.com/save/162038-laptop-notebook-free-clipart-hq/1153x886",
    "https://www.transparentpng.com/thumb/laptop/9oRuDc-refreshed-pavilion-gaming-series-launching-next-month.png",
    "https://freepngimg.com/save/161877-laptop-notebook-business-free-download-png-hq/1160x752"
  ].obs;


  RxList bannerUrlLList2 = [
    "https://freepngimg.com/thumb/dress%20shirt/4-black-dress-shirt-png-image.png",
    "https://freepngimg.com/thumb/shoes/27428-5-nike-shoes-transparent-background.png",
    "https://freepngimg.com/thumb/jeans/30-jeans-png-image.png"
  ].obs;



  @override
  void onInit() {
    super.onInit();

    //  _getStoragePermission();
  }

}
