//
//  ViewController.h
//  折叠cell
//
//  Created by mac on 2021/9/3.
//  Copyright © 2021 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView* foldTableView;
@property (nonatomic, strong) NSMutableArray* foldArray;
@property (nonatomic, strong) UIButton* foldButton;
@end

