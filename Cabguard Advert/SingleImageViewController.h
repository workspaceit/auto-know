//
//  SingleImageViewController.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 8/31/17.
//  Copyright © 2017 Workspace Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleImageViewController : UIViewController<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong,nonatomic) NSString  *imagePath;
@end
