### 1、edgesForExtendedLayout 
从iOS7开始，view controllers默认使用全屏布局(full-screen layout)。同时引进了不少属性，使你能更自由地控制view controllers如何布局views
通过设置此属性，可以设定view的边（上、下、左、右）延伸到整个屏幕。

```
@property(nonatomic,assign) UIRectEdge edgesForExtendedLayout NS_AVAILABLE_IOS(7_0); // Defaults to UIRectEdgeAll

typedef enum : NSUInteger {
   UIRectEdgeNone   = 0,
   UIRectEdgeTop    = 1 << 0,
   UIRectEdgeLeft   = 1 << 1,
   UIRectEdgeBottom = 1 << 2,
   UIRectEdgeRight  = 1 << 3,
   UIRectEdgeAll = UIRectEdgeTop | UIRectEdgeLeft | UIRectEdgeBottom | UIRectEdgeRight 
} UIRectEdge;
```
edgesForExtendedLayout属性是enum类型UIRectEdge。默认值是UIRectEdgeAll, 意味着view会被拓展到整个屏幕。比如，当你把一个UIViewControllerpush到一个UINavigationController上：
例子：

```
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor greenColor];
}
```
![edgesForExtendedLayout=UIRectEdgeAll](/Users/ljh/Desktop/屏幕快照 2017-05-26 11.01.47.png)

由此可见ViewController的view延伸到导航栏和状态栏里面，如果将self.edgesForExtendedLayout = UIRectEdgeNone;view就不会延伸到导航栏和状态栏里面，例子：

![edgesForExtendedLayout=UIRectEdgeNone](/Users/ljh/Desktop/屏幕快照 2017-05-26 11.08.23.png)

<p color=redColor> 特别注意：</p>
此属性仅适用于视图控制器中嵌入UINavigationController等容器。窗口的根视图控制器不应对该属性。这个属性的默认值是UIRectEdgeAll。
苹果文档：
>This property is applied only to view controllers that are embedded in a container such as UINavigationController. The window’s root view controller does not react to this property. The default value of this property is UIRectEdgeAll.

### 2、automaticallyAdjustsScrollViewInsets

如果view是UIScrollerView或其子类（UITableView）时,设置 self.edgesForExtendedLayout = UIRectEdgeNone;此时UIScrollerView或其子类仍然会被导航栏和状态栏覆盖，此时应该设置automaticallyAdjustsScrollViewInsets=YES(默认也是YES).viewController会table顶部添加inset，所以table会出现在navigation bar的底部。但是滚动时又能覆盖整个屏幕：

例子：

```
#import "ScrollViewInsetTableViewController.h"

@interface ScrollViewInsetTableViewController ()

@end

@implementation ScrollViewInsetTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"ScrollViewInset";
    
    self.edgesForExtendedLayout=UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets=YES;
}
```
![automaticallyAdjustsScrollViewInsets=YES](/Users/ljh/Desktop/屏幕快照 2017-05-26 11.55.20.png)

从苹果的官方文档可知，不只是navigation bar，status bar, search bar, navigation bar, toolbar, or tab bar都有类似的效果。
> The default value of this property is YES, which lets container view controllers know that they should adjust the scroll view insets of this view controller’s view to account for screen areas consumed by a status bar, search bar, navigation bar, toolbar, or tab bar. Set this property to NO if your view controller implementation manages its own scroll view inset adjustments.

### 3、extendedLayoutIncludesOpaqueBars

extendedLayoutIncludesOpaqueBars是前面两个属性的补充。该属性默认为NO，我们上面讨论的edgesForExtendedLayout属性是在navigationBar/tabBar为透明的情况下的（navigationBar/tabBar默认情况下是透明的），然而在navigationBar/tabBar为不透明时，如果edgesForExtendedLayout 为 UIRectEdgeAll，发现view并没有延伸到全屏，而是出现在navigationBar与tabBar之间（就像UIRectEdgeNone的效果一样）.

例子：

```
#import "ViewController.h"
#import "ScrollViewInsetTableViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor=[UIColor greenColor];
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.navigationController.navigationBar.translucent=NO;
}
```

[Demo](https://github.com/CuitDeerLu/FullScreenLayout-)
