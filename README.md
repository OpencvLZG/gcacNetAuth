<div align=center></br></br></br>

<center> <img src="https://thirdqq.qlogo.cn/g?b=sdk&k=iaNcdgTAPWOS0JJseiafW1Dw&kti=ZIsqGgAAAAI&s=40&t=1638804590" style="zoom:300%;" /></center>

#  <center>  gaca_net_auth</center>

###### <center>Introduce</center>

###### 							
![flutter](https://img.shields.io/badge/flutter-blue?logo=flutter) ![dart (shields.io)](https://img.shields.io/badge/dart-blue?logo=dart)  ![open sourse (shields.io)](https://img.shields.io/badge/open%20sourse-darkgreen?logo=opensourceinitiative) ![android: support (shields.io)](https://img.shields.io/badge/android-support-green?logo=android) ![window: support (shields.io)](https://img.shields.io/badge/window-support-darkblue?logo=windows10) ![github (shields.io)](https://img.shields.io/badge/github-grey?logo=github) ![gitee (shields.io)](https://img.shields.io/badge/gitee-orange?logo=gitee) ![git (shields.io)](https://img.shields.io/badge/git-lightblue?logo=git) ![Mit: license (shields.io)](https://img.shields.io/badge/Mit-license-blue?logo=bookstack) ![img](https://komarev.com/ghpvc/?username=cilang-gcacNetAuth&&style=flat-square)  

<center>use flutter implement</center>

</div>

Debug

``````makefile
cd lib
flutter pub get
flutter run
``````

App directory

`````dart
-/bean(object)
-/components(ui)
    ./main_sreen(loginpage)
	./modaldailog(modal components)
    ./network_sreen(account manage)
    home_sreen.dart 
-/constant(style)
-/controller
    ./main....er(nothing here)
    ./net_handle(net auth function)
-/utils
    ./regex(regex utils)
    ./sqlite(sqlite utils)
    	

`````

Get Start

```dart
// Get the ip address
//   ->./lib/
//		->controller/
//			->net_handle/
//				->getip.dart 

// Ip regex
//	->./lib/
//		->utils/
//			->regex/
//				->vaildIp.dart line 1
bool validateIP(String ip) {
  // 10.34.1.1 true 10.35.1.1 flase
  final RegExp ipRegex = RegExp(r'^10\.34\.(\d+)\.(\d+)$');
  if (!ipRegex.hasMatch(ip)) {
    return false;
  }

  print('IP is valid');
  return true;
}

// Refersh components
//	->./lib/
//		->components/
//			->main_sreen/
//				->main_sreen.dart  line 39
void initState() {
    //some context
    if (authIp == "") {
      Future<String> response = getIp(_ipController);
    }
  }

// Auth Button
//	->./lib/
//		->components/
//			->main_sreen/
//				->main_sreen.dart  line 352
onPressed: () async {
    //some context
    String url = 'http://10.95.254.8/quickauth.do';
    AuthUser netAuth = AuthUser(account, passWord, authIp, ua);
    bool _scLabel =await netAuth.authNet(url, context);
    if (_scLabel) {
        addAccount();
        setState(() {
            refreshAccount();
                    });
    }
}
// Auth Net 
//	->./lib/
//		->controller/
//			->net_handle/
//				->auth_net.dart  line 41




```



### App View

![image](gitImage/anroid-debug-1.png)

<center>Login page</center>

![image](gitImage/anroid-debug-2.png)

<center>Account mange page</center>

### Donate

Thank ur supprt

| <center>微信</center>                            | <center>支付宝</center>                       |
| ------------------------------------------------ | --------------------------------------------- |
| <center>![image](./gitImage/weixin.png)</center> | <center>![image](./gitImage/zfb.jpg)</center> |





### Contact 

- [bilibili](https://space.bilibili.com/433915419)
- [twitter]()
- [slack]()
- [discord]()
