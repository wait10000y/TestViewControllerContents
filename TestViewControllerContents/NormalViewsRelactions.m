//
//  NormalViewsRelactions.m
//  TestViewControllerContents
//
//  Created by 王士良 on 2017/11/24.
//  Copyright © 2017年 wsliang. All rights reserved.
//

#import "NormalViewsRelactions.h"

@implementation NormalViewsRelactions

+(NormalViewsRelactions*)shareObject
{
    static NormalViewsRelactions *object;
    if (!object) {
        object = [NormalViewsRelactions new];
    }
    return object;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.viewList = [NSMutableArray new];
        self.viewsRef = [NSMutableDictionary new];
    }
    return self;
}

-(void)addRefObject:(id)owner target:(id)target
{
    if (!self.baseObject) {
        self.baseObject = owner;
    }
    if (target) {
        if (owner) {
            NSMutableArray *oldData = [self.viewsRef objectForKey:owner];
            if (oldData) {
                [oldData addObject:target];
            }else{
                oldData = [NSMutableArray new];
                [oldData addObject:target];
                [self.viewsRef setObject:oldData forKey:owner];
            }
        }
        [self.viewList addObject:target];
    }
}

-(NSString *)showRefList
{
    NSMutableString *mStr = [NSMutableString new];
    NSObject *tempObject = self.baseObject?:[NSObject new];
    do {
        [mStr appendString:[self tranStringForObject:self.baseObject withDeepIndex:0]];

    } while (tempObject!=nil);


}

-(NSString *)tranStringForObject:(NSObject*)theObj withDeepIndex:(int)index
{
    return [NSString stringWithFormat:@"%d:%@",index,[theObj description]];
}


@end
