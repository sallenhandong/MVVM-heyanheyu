//
//  AppDelegate.m
//  myGoddess
//
//  Created by jefactoria on 17/1/24.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "YYTabBarController.h"
#import "NSObject+YYThemeExtension.h"
@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    YYTabBarController *tabBarController = [[YYTabBarController alloc] init];
    tabBarController.delegate = self;
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = tabBarController;
    self.window.backgroundColor = white_color;
    [self.window makeKeyAndVisible];
    NSString *themeColor = [[NSUserDefaults standardUserDefaults] objectForKey:@"redColor"];
    if ([themeColor isEqualToString:@""] || themeColor == nil) {
 
        [self yy_setThemeColor:[UIColor orangeColor]];
        
    }else{
    
        float red  = [[[NSUserDefaults standardUserDefaults] objectForKey:@"redColor"] floatValue];
        float green = [[[NSUserDefaults standardUserDefaults] objectForKey:@"greenColor"] floatValue];
        float blue  = [[[NSUserDefaults standardUserDefaults] objectForKey:@"blueColor"] floatValue];
   
        [self yy_setThemeColor:[UIColor colorWithRed:red green:green blue:blue alpha:1]];
    }
    
    [DCURLRouter loadConfigDictFromPlist:@"DCURLRouter.plist"];
    return YES;
}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    NSString *success  = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
     NSLog(@"token-------------%@",success);
    if (success == nil || [success isEqualToString:@""]) {
        
       
        if (tabBarController.selectedIndex == 3) {
          
            UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[[LoginViewController alloc]init]];
            [[UIApplication sharedApplication] keyWindow].rootViewController = nav;
            
        }
        else{
            return YES;
        }
        
    }
    else{
        return YES;
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
