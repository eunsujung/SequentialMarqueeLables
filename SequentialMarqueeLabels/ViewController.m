//
//  ViewController.m
//  SequentialMarqueeLabels
//
//  Created by Jung Eun Su on 2018. 2. 23..
//  Copyright © 2018년 Jung Eun Su. All rights reserved.
//

#import "ViewController.h"
#import "MarqueeTextManager.h"

@interface ViewController ()
{
    NSMutableArray<MarqueeLabel *> *queList;
    MarqueeTextManager *marqueeManager;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    queList = [[NSMutableArray alloc] init];
    [queList addObject:[self createMarqueeLabel:100]];
    [queList addObject:[self createMarqueeLabel:170]];
    [queList addObject:[self createMarqueeLabel:250]];
    
    [self.view addSubview:[queList objectAtIndex:0]];
    [self.view addSubview:[queList objectAtIndex:1]];
    [self.view addSubview:[queList objectAtIndex:2]];

    marqueeManager = [[MarqueeTextManager alloc] init];
    [marqueeManager setMarqueeLables:queList];
    [marqueeManager startMarquee:0];
}

-(MarqueeLabel *)createMarqueeLabel:(CGFloat)top
{
    MarqueeLabel *marqueeLabel = [[MarqueeLabel alloc] initWithFrame:CGRectMake(50, top, 100, 50)
                                                             duration:3 //13
                                                        andFadeLength:0.0f];
    [marqueeLabel setText:@"hellow hellow hellow hellow  "];
    [marqueeLabel setAnimationDelay:2.5];
    [marqueeLabel setHoldScrolling:YES];
    //[marqueeLabel setDelegate:self];
    return marqueeLabel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
