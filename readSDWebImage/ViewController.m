//
//  ViewController.m
//  readSDWebImage
//
//  Created by ZZG on 17/11/2.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "PresentController.h"
#import "OperationHandler.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:imageView];
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:@"http://www.osjoin.com/templets/default/images/qrcode_for_gh.jpg"] placeholderImage:[UIImage imageNamed:@"1"]];
    
    
    UIImageView * imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    [self.view addSubview:imageView2];
    [imageView2 sd_setImageWithURL:[NSURL URLWithString:@"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1318537529,891392923&fm=173&s=6728BB4759312C9E30CD48880300E011&w=309&h=226&img.JPG"] placeholderImage:[UIImage imageNamed:@"1"]];
    
    

    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 450, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(presentClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    NSLog(@"----%@",NSStringFromCGRect(btn.bounds));
    
    
    
    
    
    NSMutableDictionary *opertions = [NSMutableDictionary new];
    if (opertions) {
        NSLog(@"--------------");
    }
    
}
-(void)presentClick {
    OperationHandler * operaion = [[OperationHandler alloc] init];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
     [queue addOperation:operaion];
    sleep(2);
    OperationHandler * operaion1 = [[OperationHandler alloc] init];
    [queue addOperation:operaion1];

    
    sleep(2);
    OperationHandler * operaion2 = [[OperationHandler alloc] init];
    [queue addOperation:operaion2];
    
    
    
    return;
    PresentController * present = [[PresentController alloc] init];
    
    [self presentViewController:present animated:YES completion:nil];
}

/**1.0
 * [self treeChild:@"123"];
 * [self treeChild:nil];
 ***学习一
 *** 新的三元表达式写法
 */
-(void)treeChild:(NSString *)optionsKeys{
    NSString * c1 = optionsKeys ? optionsKeys : @"去别处取数据去吧";
    NSString * c2 = optionsKeys ?: @"新的三元表达式去别处取数据去吧";
    NSLog(@"---c1:%@-----c2:%@",c1,c2);
}


/**2.0
 & 应该是只能出现在数字时 使用；；
 */
-(void)coordationTree {
    NSString * t1 = @"123";
    NSString * t2 = @"456";
    if (1 & 1) {
        NSLog(@"-----------");
    }else {
        NSLog(@",mmmmmm");
    }
}


/**3.0
 * 互斥锁 学习*********多线程********
 是几种iOS多线程同步机制中最慢的一个，同时也是最方便的一个。
 */
-(void)synchronizeds{

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
