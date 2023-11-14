import 'package:get/get.dart';

class CartPageController extends GetxController{

  final currentItem = 1.obs;

  void plushItem(){
    currentItem.value++;
  }

  void minesItem(){
    currentItem.value--;
  }

  RxList BCImg = [
    "https://www.cnet.com/a/img/resize/71701e7c6d9b94a8ec44c4e9610106a49c05e468/hub/2022/12/16/eb02a6aa-f331-4fbe-9e5f-35efd2198f8d/p1002240-1.jpg?auto=webp&fit=crop&height=900&width=1200",
    "https://rukminim2.flixcart.com/image/832/832/xif0q/trouser/y/m/z/-original-imags7jvrkxnfege.jpeg?q=70",
    "https://media.istockphoto.com/id/1130447045/photo/multi-colored-toothbrushes-in-a-glass-cup-blue-background.jpg?s=612x612&w=0&k=20&c=vvPdOtZ-3YT98tMh5NChE1Ljn1Xdfu9Jxdk4qY26zgE=",
    "https://www.macworld.com/wp-content/uploads/2023/01/13inch-macbook-pro-m2-013-2.jpg?quality=50&strip=all",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqubnmONj2xaXaTMXmf-0jQ3yDuEIHNPgqqQ&usqp=CAU",
    "https://blog.ipleaders.in/wp-content/uploads/2019/10/GEN-Sports.png"
  ].obs;
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("CART-PAGE-WELCOME");
  }



}

