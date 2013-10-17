//
//  RSAutoLayoutExplicitViewController.m
//  AutoLayoutDemo
//
//  Created by Venkat Rao on 10/16/13.
//  Copyright (c) 2013 Rao Studios. All rights reserved.
//

#import "RSAutoLayoutExplicitViewController.h"

@interface RSAutoLayoutExplicitViewController ()

@property (strong, nonatomic) UILabel * titleLabel;
@property (strong, nonatomic) UILabel * descriptionLabel;

@property (strong, nonatomic) UIButton * checkPricesButton;
@property (strong, nonatomic) UIButton * directionButton;
@property (strong, nonatomic) UIButton * callButton;

@property (strong, nonatomic) UIImageView * imageView;

@end

@interface UIWindow()

+ (UIWindow *)keyWindow;
- (NSString *)_autolayoutTrace;

@end

@implementation RSAutoLayoutExplicitViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
	// Do any additional setup after loading the view.
    //[self wrapperForLoggingConstraints];
    [self inititalizeAllocView];
    [self addConstraints];
    NSLog(@"button frame: %@", NSStringFromCGRect(self.callButton.frame));

    [super viewDidLoad];

}

-(void)viewDidAppear:(BOOL)animated {
    //[self performSelector:@selector(wrapperForLoggingConstraints) withObject:nil afterDelay:.3];
}

- (void)wrapperForLoggingConstraints
{
    NSLog(@"%@",([[UIWindow keyWindow] _autolayoutTrace]));
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) inititalizeAllocView {

    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"Machu Picchu";
    [self.titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.titleLabel];

    self.descriptionLabel = [[UILabel alloc] init];
    self.descriptionLabel.text = @"Peru";
    [self.descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.descriptionLabel];

    self.checkPricesButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.checkPricesButton setTitle:@"Check Airline Prices" forState:UIControlStateNormal];
    [self.checkPricesButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.checkPricesButton];


    self.directionButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.directionButton setTitle:@"Directions" forState:UIControlStateNormal];
    [self.directionButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.directionButton];


    self.callButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.callButton setTitle:@"Call Button" forState:UIControlStateNormal];
    [self.callButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.callButton];



    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"machu-picchu-peru.jpg"]];
    [self.imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.imageView];

}

-(void) addConstraints {

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.topLayoutGuide
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.titleLabel
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1
                                                          constant:-8]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.imageView
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1
                                                           constant:-8]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.descriptionLabel
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1
                                                           constant:-8]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionLabel
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.callButton
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1
                                                           constant:-8]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.callButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.directionButton
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1
                                                           constant:-8]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.directionButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.checkPricesButton
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1
                                                           constant:-8]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.checkPricesButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.bottomLayoutGuide
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1
                                                           constant:-8]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1
                                                           constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1
                                                           constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1
                                                           constant:0]];

    [self.imageView setContentCompressionResistancePriority:749 forAxis:UILayoutConstraintAxisHorizontal];
    [self.imageView setContentCompressionResistancePriority:749 forAxis:UILayoutConstraintAxisVertical];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1
                                                           constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionLabel
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1
                                                           constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.callButton
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1
                                                           constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.directionButton
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1
                                                           constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.checkPricesButton
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1
                                                           constant:0]];
}

@end
