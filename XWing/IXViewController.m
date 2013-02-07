//
//  IXViewController.m
//  XWing
//
//  Created by Javier García Gallego on 25/01/13.
//  Copyright (c) 2013 ixavy. All rights reserved.
//

#import "IXViewController.h"

@interface IXViewController ()

@end

@implementation IXViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Creamos el reconocedor de gestos
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
    
    // lo añadimos a la vista principal
    
    [self.view addGestureRecognizer:tap];
    
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)onTap:(UITapGestureRecognizer *) tap {
    // comprobar el estado
    if(tap.state == UIGestureRecognizerStateRecognized) {
        CGPoint center = [tap locationInView:self.spaceView];
        
        UIViewAnimationOptions options = UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut;
        
        [UIView animateWithDuration:1.5
                              delay:0
                            options:options
                         animations:^{
                             self.xwingView.center = center;
                         }
                         completion:^(BOOL finished) {
                             //
                         }];
        
        [UIView animateWithDuration:0.75
                              delay:0
                            options:options
                         animations:^{
                                self.xwingView.transform = CGAffineTransformMakeRotation(M_PI_2);
                            } completion:^(BOOL finished) {
                                [UIView animateWithDuration:0.75
                                                      delay:0
                                                    options:options
                                                 animations:^{
                                                     self.xwingView.transform = CGAffineTransformIdentity;
                                                 } completion:nil];
                            }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
