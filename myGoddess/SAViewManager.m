//
//  SAViewManager.m
//  myGoddess
//
//  Created by jefactoria on 17/2/7.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "SAViewManager.h"

@implementation SAViewManager

-(void)sa_view:(__kindof UIView *)view withEvents:(NSDictionary *)events url:(NSString *)url{

    if ([events objectForKey:@"fileName"]) {
        
        [DCURLRouter pushURLString:[NSString stringWithFormat:@"%@?fileName=%@",url,[events objectForKey:@"fileName"]] animated:YES];
        
    }else{
        
        [DCURLRouter pushURLString:url animated:YES];
    }
    
}
@end
