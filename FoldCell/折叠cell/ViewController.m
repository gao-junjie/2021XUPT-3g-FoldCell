//
//  ViewController.m
//  折叠cell
//
//  Created by mac on 2021/9/3.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _foldTableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 100, 380, 50) style:UITableViewStylePlain];
    _foldTableView.delegate = self;
    _foldTableView.dataSource = self;
    [self.view addSubview:_foldTableView];
    [_foldTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"normal"];
    
    _foldArray = [NSMutableArray arrayWithObjects:@"内容1", @"内容2", @"内容3", @"内容4", @"内容5", @"内容6", @"内容7", nil];
    
    _foldButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_foldButton.layer setMasksToBounds:YES];
    [_foldButton.layer setCornerRadius:15.0];
    [_foldButton setTitle:@"点击展开" forState:UIControlStateNormal];
    [_foldButton setTitle:@"点击收起" forState:UIControlStateSelected];
    [_foldButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_foldButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    _foldButton.backgroundColor = [UIColor yellowColor];
    _foldButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [_foldButton addTarget:self action:@selector(pressFoldButton:) forControlEvents:UIControlEventTouchUpInside];
    _foldButton.frame = CGRectMake(0, 0, 380, 50);
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _foldArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* normalCell = [_foldTableView dequeueReusableCellWithIdentifier:@"normal" forIndexPath:indexPath];
    [normalCell.layer setMasksToBounds:YES];
    [normalCell.layer setCornerRadius:15.0];
    if (indexPath.row == 0) {
        [normalCell.contentView addSubview:_foldButton];
    } else {
        normalCell.textLabel.text = _foldArray[indexPath.row - 1];
        normalCell.textLabel.textColor = [UIColor blackColor];
        normalCell.textLabel.textAlignment = NSTextAlignmentCenter;
        normalCell.textLabel.font = [UIFont systemFontOfSize:20];
        normalCell.backgroundColor = [UIColor yellowColor];
    }
    return normalCell;
}

- (void)pressFoldButton:(UIButton*)button {
    if (button.selected == YES) {
        button.selected = NO;
        _foldTableView.frame = CGRectMake(10, 100, 380, 50);
    } else if (button.selected == NO) {
        button.selected = YES;
        _foldTableView.frame = CGRectMake(10, 100, 380, 50 * _foldArray.count);
    }
}

@end
