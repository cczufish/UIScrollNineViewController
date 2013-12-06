//
//  FirstlViewController.m
//  CloudSchool
//
//  Created by sai on 13-12-6.
//  Copyright (c) 2013年 kanon. All rights reserved.
//

#import "FrontViewController.h"


#define CP_Words_Container_Width 300
#define CP_Words_Container_Margin 5
#define CP_Words_Container_Colomes 3
#define CP_Words_Container_Rows 3
#define CP_Word_Cell_Margin 4
#define CP_Word_Cell_Size (CP_Words_Container_Width-CP_Words_Container_Margin*2-CP_Word_Cell_Margin*(CP_Words_Container_Colomes-1))/CP_Words_Container_Colomes

#define CP_Answer_Button_Tag_Offset 1000
#define CP_Word_Button_Tag_Offset 10000

@interface FrontViewController ()

@end

@implementation FrontViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
    }
    return self;
}


- (void)initBtnview{
    
    // Do any additional setup after loading the view.
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 118 , 320, 460)];
    
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(320, 630);
    [self.view addSubview:scrollView];
    
    
    for(int i=0; i< [daArr count] ; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        //[btn setBackgroundImage:[UIImage imageNamed:@"btn_nomal_pressed.png"] forState:UIControlStateHighlighted];
        [btn setImage:[UIImage imageNamed:@"home_page_physics.png"] forState:UIControlStateNormal];
        
        btn.titleEdgeInsets = UIEdgeInsetsMake(5, -50, -60, 15);
        btn.imageEdgeInsets = UIEdgeInsetsMake(5, 20, 30,15);
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        btn.tag = i+CP_Word_Button_Tag_Offset;
        [btn addTarget:self action:@selector(wordButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [btn addTarget:self action:@selector(wordButtonTouchDown:) forControlEvents:UIControlEventTouchDown];
        [btn addTarget:self action:@selector(wordButtonTouchCancel:) forControlEvents:UIControlEventTouchCancel];
        [btn addTarget:self action:@selector(wordButtonTouchUpOutside:) forControlEvents:UIControlEventTouchUpOutside];
        
        [btn setTitle:@"大傻逼" forState:UIControlStateNormal];
        
        
        
        CGFloat x = i%CP_Words_Container_Colomes*107;
        CGFloat y = (i/CP_Words_Container_Colomes)*107+20 ;
        
        [btn setFrame:CGRectMake(x, y, 107, 107)];
        
        [scrollView addSubview:btn];
        
        [UIView animateWithDuration:1.0 animations:^{
            
            [btn setFrame:CGRectMake(x, y, 107, 107)];
            
        } completion:^(BOOL finished){
            
            if (finished) {
                
                [UIView animateWithDuration:0.3 animations:^{
                    
                    [btn setFrame:CGRectMake(x, y, 107, 107)];
                    
                } completion:^(BOOL finished){
                    
                }];
            }
            
        }];
        
        
        
        
        
    }
    
    [self.view addSubview:scrollView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationController.navigationBar.hidden = YES;
    


    daArr = [[NSArray alloc] initWithObjects:@"数学",@"英语",@"语文",@"物理",@"化学",@"生物",@"地理",@"历史",@"政治", nil];
    
    [self initBtnview];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)wordButtonSelected:(id)sender
{

}



- (void)wordButtonTouchDown:(id)sender
{
    
    
}


- (void)wordButtonTouchCancel:(id)sender{
    //    UIButton *btn = (UIButton*)sender;
    //    [btn setBackgroundImage:[UIImage imageNamed:@"btn_nomal.png"] forState:UIControlStateNormal];
}


- (void)wordButtonTouchUpOutside:(id)sender{
    //DLog(@"yushuhuionfldkmg;ldfml");
}





@end
