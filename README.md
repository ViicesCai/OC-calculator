# OC-calculator
一个没有灵魂的计算器（未完成）
简单整理一下思路，要完成一个计算器得搞懂的基础知识：
1.按钮、显示界面如何生成
2.ViewController.h及ViewController里要如何定义（我尝试用THINKPHP架构原理去理解他，公共的属性全部都放在.h中然后通过.m中的一个个操作去调用它）
  逻辑上：私有属性获取公共属性进行操作会更合理些。
3.⭐关于如何获取button的点击事件，这个问题困扰了我一整天。我想，先从最基础的地方认识他，在OC中如何定义一个button事件
      UIButton* btn = [[UIButton alloc] init]; or UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];// 这两者都可以实现创建一个button
      [btn addTarget:self action:@selector(doSth:) forControlEvents:UIControlEventTouchUpInside]; // UIControlEventTouchUpInside：当这个按钮被点击时执行doSth：这个操作
      
      // 构造方法函数
      -(void)doSth:(UIButton*)sender{
      NSLog(@"click do Sth");
      }
 4.button里面定义不同按钮获取不同的值，我是通过tag来获取这些值的。
 5.数据类型转换：数据需要从string与double两者间相互转换。
 
 这是两天学习中的一些思考。
 don't be a burden.
