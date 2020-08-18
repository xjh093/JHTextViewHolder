//
//  ViewController.m
//  JHTextViewHolder
//
//  Created by HaoCold on 2020/8/18.
//  Copyright © 2020 HaoCold. All rights reserved.
//

#import "ViewController.h"
#import "UITextView+JHHolder.h"

@interface ViewController ()
@property (nonatomic,  strong) UITextView *textView;
@property (nonatomic,  strong) UITextView *textView1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.textView];
    [self.view addSubview:self.textView1];
    
    self.textView.jh_holder.text = @"input here...";
    self.textView.jh_holder.color = [UIColor brownColor];
    
    self.textView1.jh_holder.text = @"在此输入...";
    self.textView1.jh_holder.color = [UIColor orangeColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (UITextView *)textView{
    if (!_textView) {
        UITextView *textView = [[UITextView alloc] init];
        textView.frame = CGRectMake(10, 120, 250, 100);
        textView.textColor = [UIColor blackColor];
        textView.font = [UIFont systemFontOfSize:19];
        textView.textAlignment = NSTextAlignmentLeft;
        textView.showsVerticalScrollIndicator = NO;
        textView.layer.borderWidth = 1;
        textView.layer.borderColor = [UIColor blackColor].CGColor;
        _textView = textView;
    }
    return _textView;
}

- (UITextView *)textView1{
    if (!_textView1) {
        UITextView *textView = [[UITextView alloc] init];
        textView.frame = CGRectMake(10, 240, 250, 100);
        textView.textColor = [UIColor blackColor];
        textView.font = [UIFont systemFontOfSize:19];
        textView.textAlignment = NSTextAlignmentLeft;
        textView.showsVerticalScrollIndicator = NO;
        textView.layer.borderWidth = 1;
        textView.layer.borderColor = [UIColor blackColor].CGColor;
        _textView1 = textView;
    }
    return _textView1;
}


@end
