//
//  PresentController.m
//  readSDWebImage
//
//  Created by ZZG on 17/11/2.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "PresentController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface PresentController ()

@end

@implementation PresentController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:imageView];
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:@"http://www.osjoin.com/templets/default/images/qrcode_for_gh.jpg"] placeholderImage:[UIImage imageNamed:@"1"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
