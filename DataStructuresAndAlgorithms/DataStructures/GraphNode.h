//
//  GraphNode.h
//  DataStructuresAndAlgorithms
//
//  Created by Alexey Patosin on 22/02/15.
//  Copyright (c) 2015 TestOrg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GraphNode : NSObject

+ (instancetype)nodeWithValue:(NSString *)value;

- (void)addConnection:(GraphNode *)node;
- (void)removeConnection:(GraphNode *)node;

- (NSString *)value;
- (NSArray *)connections;

@end
