- # OC-calculator

  一个没有灵魂的计算器 ~~(未完成)~~ **（未完善）**
  简单整理一下思路，要完成一个计算器得搞懂的基础知识：

  1. 按钮、显示界面如何生成

  2. ViewController.h及ViewController里要如何定义（我尝试用THINKPHP架构原理去理解他，公共的属性全部都放在.h中然后通过.m中的一个个操作去调用它）
     逻辑上：私有属性获取公共属性进行操作会更合理些。

  3. ⭐关于如何获取button的点击事件，这个问题困扰了我一整天。我想，先从最基础的地方.

     ```objective-c
     // 在OC中如何定义一个button事件
     // 这两者都可以实现创建一个button
     UIButton *btn = [[UIButton alloc] init];
     UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
     // UIControlEventTouchUpInside：当这个按钮被点击时执行doSth：这个操作
     [btn addTarget:self action:@selector(doSth:)
     forControlEvents:UIControlEventTouchUpInside];
     
      // 构造方法函数
       -(void)doSth:(UIButton*)sender{
       NSLog(@"click do Sth");
       }
     ```

     

  4. button里面定义不同按钮获取不同的值，我是通过tag来获取这些值的。

  5. 数据类型转换：数据需要从string与double两者间相互转换。

     **这是两天学习中的一些思考。**
      *Don't be a burden.*

     

     ------

     ## 5-22 

     今天把代码更新了，因为Git还不太会用，所以直接把之前的代码给覆盖了

     我把对整个计算器实现的过程。目前为止我搞懂的 都一一给标识了出来，实现一个计算器对于一个OC的初学者来说我觉得非常重要，因为计算器要考虑的东西很多。在实现的过程中去学习会更加的高效。

     **我把一下这两天困扰我的点一一列出：**

     - 何时定义一个全局变量,ViewController.h这个页面，并不是非得定义属性在上面，@property 实例变量，你通过他定义的每一个变量都是一个全局对象或者变量。OC中并没有像C当中：* a表示一个指针 a表示其地址。*a在OC中就是一个对象a。你通过在.m这个文件的头部使用#import 去调用他。用_a对其赋值， _a与self.a也大有区别，前者表示全局，后者表示私有（局部）。

     - 

       ```objective-c
       // NSMutableStromh stromhWithFormat 表示对可变字符串进行初始化并赋值
       _string = [NSMutableString stringWithFormat:@"1"];
       // 在字符串后加入_virwUILabel.txt的字符串。 
       [_string appendString:_viewUILabel.text];
       // 功能同上，可以插入任何类型的数值。
       [_string appendFormat:@"%@",_viewUILabel.text];
       // 区别-功能一致
       [_string stringByAppendingString:_viewUILabel.text];
       [_string stringByAppendingFormat:@"%@",_viewUILable.text];
       ```

  

  ------

  

  ## 5-23

  - 基本实现了计算器的基础功能，修改了部分逻辑错误。

  - 重新对按钮进行定义，修改了按钮原来的造型。

  - 增加%、.对运算功能。

  - 实现了连续运算。
    **许多地方还需要完善，解决用户不规范导致的运算逻辑的错误**

    今天是计算器开发的第四天了，终于可以实现一个基础计算器该具备的功能了。

    说说今天遇到的问题：

    - 连续运算

      连续计算也是一个计算器该具备的基础功能，仔细思考一下运算逻辑 其实实现起来很容易，相对于这个计算器项目 我定义了num1 num2来接收用户输入的值，但是 当用户要进行连续运算时，我们定义的值就少了一个新的数据，我们要将上一个运算的结果当作num2来进行计算。仔细分析用户的运算流程，这个功能很容易就实现了。

    - 连续输入

      **这里只取了部分的代码截图**

      ```objective-c
       switch (numUIButton.tag) {
                      
                  case 1:
                      if(_viewUILabel.text == self.str){
                          self.string = [NSMutableString stringWithFormat:@"1"];
                          _viewUILabel.text = [NSString stringWithFormat:@"%@",self.string];
                      }else{
                          /**
                           这些被注释掉的代码很有必要看，对于一个noob来说这很基础也很有启发。他决定了你计算器数字的排列方式。
                           这个代码的功能是在字符串之后插入一个字符串，我一开始是分开定义。
                           如果分开定义会导致，你的_string变量有一个“1”的可变变量，
                           // [_string appendString:_viewUILabel.text];这句话逻辑上理解是 _viewUILable.txt这个变量之后插入“1”，好像挺符合逻辑的，
                           其实不然，你的_string变量在今入cash之前就被重新赋值了，因此你变成一只在“1”后面插入字符串
                           举个理解 当前_viewUILable显示的是123,这是你在计算器上按1 最终新生成的数字是反过来的 变成了1123.
                           :)
                           **/
                          // _string = [NSMutableString stringWithFormat:@"1"];
                          // [_string appendString:_viewUILabel.text];
                          // [_string appendFormat:@"%@",_viewUILabel.text];
                          // [_string stringByAppendingString:_viewUILabel.text];
                          // [_string stringByAppendingFormat:@"%@",_viewUILable.text];
                          [self.string appendString:[NSMutableString stringWithFormat:@"1"]];
                          // NSString stringWithString 这个函数非常重要，他用来实现字符串的赋值。
                          _viewUILabel.text = [NSString stringWithString:self.string];
                      }
                      _num1 = [self.string doubleValue];
      break;
      ```

      


     

   
