# CrossSlideBar
    A customizable horizontal slider.
    The main documentation for this project is "CrossSlideBar" You can download this file for the sliding title effect.

# integration method
    Drag and drop CrossSlideBarr under CrossSlideBarMain into the project.
    Add a header file # import "slideButtonCollectionView. h".
# CocoaPods integration
    pod search CrossSlideBar
    #import <slideButtonCollectionView.h>
    
## Main code examples

    @property(nonatomic,strong)slideButtonCollectionView * slideButtonV;

    -(slideButtonCollectionView *)slideButtonV{
      if (!_slideButtonV) {
        _slideButtonV = [[slideButtonCollectionView alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 30)];
        _slideButtonV.titleArr = @[@"牙尚",@"童话",@"孕记",@"牙圈",@"人物",@"专题"];
        _slideButtonV.textColor = [UIColor blackColor];
        _slideButtonV.textSeltedColor = [UIColor redColor];
        _slideButtonV.bottomLinSeltedColor = [UIColor redColor];
        _slideButtonV.ClickTitleReturn = ^(NSString *titleIndex) {
            NSLog(@"%@",titleIndex);
          };
      }
      return _slideButtonV;
    }
## viewDidLoad
    [self.view addSubview:self.slideButtonV];
