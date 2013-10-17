//
//  RSAutolayoutVisualFormatLanguageViewController.m
//  AutoLayoutDemo
//
//  Created by Venkat Rao on 10/16/13.
//  Copyright (c) 2013 Rao Studios. All rights reserved.
//

#import "RSAutolayoutVisualFormatLanguageViewController.h"

@interface RSAutolayoutVisualFormatLanguageViewController ()

@property (strong, nonatomic) UILabel * titleLabel;
@property (strong, nonatomic) UILabel * descriptionLabel;

@property (strong, nonatomic) UIButton * checkPricesButton;
@property (strong, nonatomic) UIButton * directionButton;
@property (strong, nonatomic) UIButton * callButton;

@property (strong, nonatomic) UIImageView * imageView;

@end

@implementation RSAutolayoutVisualFormatLanguageViewController

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    [self inititalizeAllocView];
    [self addConstraints];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) inititalizeAllocView {

    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"Machu Picchu";
    [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.titleLabel];

    self.descriptionLabel = [[UILabel alloc] init];
    self.descriptionLabel.text = @"Peru";
    [self.descriptionLabel setTextAlignment:NSTextAlignmentCenter];
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
    [self.imageView setContentCompressionResistancePriority:749 forAxis:UILayoutConstraintAxisHorizontal];
    [self.imageView setContentCompressionResistancePriority:749 forAxis:UILayoutConstraintAxisVertical];
    
}

-(void) addConstraints {

    NSDictionary *views = @{@"topLayoutGuide": self.topLayoutGuide,
                                    @"bottomLayoutGuide": self.bottomLayoutGuide,
                            @"titleLabel": self.titleLabel,
                            @"imageView": self.imageView,
                            @"descriptionLabel": self.descriptionLabel,
                            @"callButton": self.callButton,
                            @"directionButton": self.directionButton,
                            @"checkPricesButton": self.checkPricesButton};


    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[topLayoutGuide]-[titleLabel]-[imageView]-[descriptionLabel]-[callButton]-[directionButton]-[checkPricesButton]-[bottomLayoutGuide]"
                                                                     options:0
                                                                     metrics:0
                                                                        views:views]];


    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[titleLabel]|"
                                                                      options:0
                                                                      metrics:0
                                                                        views:views]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imageView]|"
                                                                      options:0
                                                                      metrics:0
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[descriptionLabel]|"
                                                                      options:0
                                                                      metrics:0
                                                                        views:views]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[callButton]|"
                                                                      options:0
                                                                      metrics:0
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[directionButton]|"
                                                                      options:0
                                                                      metrics:0
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[checkPricesButton]|"
                                                                      options:0
                                                                      metrics:0
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imageView(320)]|"
                                                                      options:0
                                                                      metrics:0
                                                                        views:views]];
}


@end
