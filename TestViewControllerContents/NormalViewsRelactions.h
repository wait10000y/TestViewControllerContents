//
//  NormalViewsRelactions.h
//  TestViewControllerContents
//
//  Created by 王士良 on 2017/11/24.
//  Copyright © 2017年 wsliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NormalViewsRelactions : NSObject

+(NormalViewsRelactions*)shareObject;

@property (nonatomic) NSMutableDictionary *viewsRef;
@property (nonatomic) NSMutableArray *viewList;

@property (nonatomic) NSObject *baseObject;

// owner 是所有者(已存在的)
-(void)addRefObject:(NSObject *)owner target:(NSObject *)target;


@end
