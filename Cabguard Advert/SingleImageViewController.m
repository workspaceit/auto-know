//
//  SingleImageViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 8/31/17.
//  Copyright © 2017 Workspace Infotech. All rights reserved.
//

#import "SingleImageViewController.h"
#import "UIImageView+WebCache.h"
@interface SingleImageViewController ()

@end

@implementation SingleImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.minimumZoomScale=0.5;
    
    self.scrollView.maximumZoomScale=6.0;
    
    self.scrollView.contentSize=CGSizeMake(1280, 960);
    
    self.scrollView.delegate=self;
    if(![self.imagePath isEqualToString: @""]){
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:[NSMutableString stringWithFormat:@"http://advertising.cabguardpro.com/images/%@",_imagePath]]
                          placeholderImage:nil];
    }
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView

{
    
    return self.imageView;
    
}
- (IBAction)closeAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
