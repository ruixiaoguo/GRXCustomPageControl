//
//  ViewController.m
//  GGCustomPageControl
//
//  Created by GRX on 2023/1/10.
//

#import "ViewController.h"
#import "GGPageControl.h"

@interface ViewController ()<GGPageControlDelegate>
@property(nonatomic,strong) GGPageControl *pageControl;
@property(nonatomic,assign) NSInteger currenPage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currenPage = 0;
    self.view.backgroundColor = [UIColor grayColor];
    self.pageControl = [[GGPageControl alloc] initWithFrame:CGRectMake(0, 280,[UIScreen mainScreen].bounds.size.width, 30)];
    self.pageControl.numberOfPages = 6;
    self.pageControl.currentControlSize=CGSizeMake(18, 6);
    self.pageControl.otherControlSize=CGSizeMake(6, 6);
    self.pageControl.otherColor = [UIColor whiteColor];
    self.pageControl.controlSpacing=10;
    self.pageControl.currentBkImg=[UIImage imageNamed:@"LunboSel"];
    self.pageControl.delegate=self;
    [self.view addSubview:self.pageControl];
    UIButton *changeBtn = [[UIButton alloc]init];
    changeBtn.frame = CGRectMake(160, 380, 100, 40);
    changeBtn.layer.borderWidth = 1;
    changeBtn.layer.cornerRadius = 20;
    changeBtn.backgroundColor = [UIColor orangeColor];
    changeBtn.layer.borderColor = [UIColor orangeColor].CGColor;
    [changeBtn setTitle:@"切换" forState:UIControlStateNormal];
    [self.view addSubview:changeBtn];
    [changeBtn addTarget:self action:@selector(changeBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)changeBtnClick{
    self.currenPage += 1;
    if(self.currenPage==6){
        self.currenPage = 0;
    }
    self.pageControl.currentPage = self.currenPage;
}

-(void)ellipsePageControlClick:(GGPageControl *)pageControl index:(NSInteger)clickIndex{
    NSLog(@"%ld",clickIndex);
}
@end
