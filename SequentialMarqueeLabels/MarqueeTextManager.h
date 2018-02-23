//
//  MarqueeTextManager.h
//
//  Created by Jung Eun Su on 2018. 1. 12..
//

#import <Foundation/Foundation.h>
#import "MarqueeLabel.h"

@interface MarqueeTextManager : NSObject<MarqueeLabelDeleagete>
@property(nonatomic, retain) NSMutableArray<MarqueeLabel *> *marqueeLables;
/**
Prevent reordering
 */
@property(nonatomic, retain) NSMutableArray<MarqueeLabel *> *prevMarqueeLabels;
/**/
@property(nonatomic) NSInteger queIndex;

-(BOOL)isTooMuch:(MarqueeLabel *)marqueeLabel;
-(void)startMarquee;
-(void)startMarquee:(NSInteger)index;
-(void)removeAnimation;

@end
