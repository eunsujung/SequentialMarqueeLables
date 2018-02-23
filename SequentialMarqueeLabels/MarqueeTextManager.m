//  MarqueeTextManager.m
//
//  Created by Jung Eun Su on 2018. 1. 12..
//

#import "MarqueeTextManager.h"

@implementation MarqueeTextManager
@synthesize marqueeLables, queIndex, prevMarqueeLabels;

#pragma mark - instance methods

-(void)setTCLScrollTextButtons:(NSMutableArray *) tclScrollTextButtons;
{
    NSLog(@"setTCLScrollTextButtons-in");
    prevMarqueeLabels = [[NSMutableArray alloc] init];
    self.marqueeLables = tclScrollTextButtons;
    prevMarqueeLabels = tclScrollTextButtons;
}

-(void)startMarquee:(NSInteger)index
{
    MarqueeLabel *marqueeLabel = nil;
    [self removeAnimation];
    
    @try{
        marqueeLabel  = [marqueeLables objectAtIndex:index];
        marqueeLabel.delegate = self;
        [marqueeLabel setHoldScrolling:NO];
        [marqueeLabel triggerScrollStart];
        queIndex++;
    }@catch(NSException *e){
        //NSRangeException
        queIndex = index;
    }
}

/**
 Let's scroll !
 */
-(void)startMarquee
{
    NSLog(@"startMarquee in");
    [self removeAnimation];
    
    if(marqueeLables == nil || [marqueeLables count] == 0 || [self tooMuchCount] == 0)
    {
        NSLog(@"startMarquee return");
        return;
    }

    MarqueeLabel *marqueeLabel = nil;
    
    @try{
        marqueeLabel  = [marqueeLables objectAtIndex:queIndex];
    }@catch(NSException *e){
        //NSRangeException
        queIndex = 0;
    }
    
    /*
     Let's scroll
     */
    if ([self isTooMuchMarqueeLable:marqueeLabel])
    {
        NSLog(@"startMarquee-too much:%@", marqueeLabel.text);
        marqueeLabel.delegate = self;
        [marqueeLabel setHoldScrolling:NO];
        [marqueeLabel triggerScrollStart];
    
        if(queIndex == [marqueeLables count] - 1)
            queIndex = 0;
        else
            queIndex++;
        
    } else {
        if(queIndex == [marqueeLables count] - 1)
            queIndex = 0;
        else
            queIndex++;
        
        [self startMarquee];
    }
}

-(void)removeAnimation
{
    for (MarqueeLabel *lb in marqueeLables) {
        [[lb subLabel].layer removeAllAnimations];
        NSLog(@"loop text:%@", lb.text);
    }
}

#pragma mark - private methods

/**
 MarqueeLabel is too much
 */
-(BOOL)isTooMuchMarqueeLable:(MarqueeLabel *)label
{
    UILabel *testLabel = [[UILabel alloc] init];
    [testLabel setText:[label text]];
    [testLabel setFont:[label font]];
    [testLabel setFrame:label.bounds];
    [testLabel sizeToFit];
    
    if(label.bounds.size.width < testLabel.bounds.size.width)
        return YES;
    else
        return NO;
}

/**
 get long lable count
 */
-(NSInteger)tooMuchCount
{
    NSInteger *count = 0;
    for (int i = 0; i < [self.marqueeLables count]; i++)
    {
        MarqueeLabel *bt  = (MarqueeLabel *)[marqueeLables objectAtIndex:i];
        if ([self isTooMuchMarqueeLable:bt])
        {
            count++;
        }
    }
    return count;
}

#pragma mark - MarqueeLabel delegate methods

-(void)didEndScroll:(NSString *)buttonId
{
    NSLog(@"didEndScroll:%@", buttonId);
    [self startMarquee];
}

-(void)didStartScroll:(NSString *)buttonId
{
    NSLog(@"didStartScroll:%@", buttonId);
}

@end



