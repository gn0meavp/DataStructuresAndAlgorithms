//
//  GraphNode.m
//  DataStructuresAndAlgorithms
//
//  Created by Alexey Patosin on 22/02/15.
//  Copyright (c) 2015 TestOrg. All rights reserved.
//

#import "GraphNode.h"

@interface GraphNode ()
@property (nonatomic, strong) NSMutableArray *nodes;
@property (nonatomic, strong) NSString *value;
@end

@implementation GraphNode

+ (instancetype)nodeWithValue:(NSString *)value {
    GraphNode *node = [GraphNode new];
    node.value = value;
    return node;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _nodes = [NSMutableArray array];
    }
    return self;
}

- (NSString *)description {
    return self.value;
}

- (void)addConnection:(GraphNode *)node {
    [self.nodes addObject:node];
}

- (void)removeConnection:(GraphNode *)node {
    [self.nodes removeObject:node];
}

- (NSString *)value {
    return _value;
}

- (NSArray *)connections {
    return [self.nodes copy];
}

@end
