# SequentialMarqueeLables

# The text labels scroll in sequence.

<p align="center"><img src="https://github.com/eunsujung/SequentialMarqueeLables/blob/master/sp.png" width="300px" bordercolor="green" border="1" /></p>


Simple Code

MarqueeLabel *marqueeLabel = [[MarqueeLabel alloc] initWithFrame:CGRectMake(50, top, 100, 50)
                                                          duration:3 
                                                          andFadeLength:0.0f];
[marqueeLabel setText:@"hellow hellow hellow hellow  "];

[marqueeLabel setAnimationDelay:2.5];

[marqueeLabel setHoldScrolling:YES];
