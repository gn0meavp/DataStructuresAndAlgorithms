//
//  TopologicalSorting.m
//  DataStructuresAndAlgorithms
//
//  Created by Alexey Patosin on 22/02/15.
//  Copyright (c) 2015 TestOrg. All rights reserved.
//

#import "TopologicalSorting.h"

@implementation TopologicalSorting

+ (NSArray *)sortWithRootNode:(GraphNode *)rootNode {

    NSMutableSet *greyNodes = [NSMutableSet set];
    NSMutableSet *blackNodes = [NSMutableSet set];
    NSMutableArray *stack = [NSMutableArray array];
    
    GraphNode *curNode = rootNode;
    [greyNodes addObject:curNode];
    
    while (curNode) {

        NSArray *connections = curNode.connections;
        
        GraphNode *nextNode = nil;
        
        for (GraphNode *node in connections) {
            if([greyNodes containsObject:node] == NO && [blackNodes containsObject:node] == NO) {
                nextNode = node;
                break;
            }
        }
        
        if (nextNode) {
            [greyNodes addObject:nextNode];
            curNode = nextNode;
        }
        else {
            [greyNodes removeObject:curNode];
            [blackNodes addObject:curNode];
            [stack addObject:curNode];
            
            curNode = [greyNodes anyObject];
        }
        
    }
    
    NSArray *path = [[stack reverseObjectEnumerator] allObjects];

    return path;
    
}



@end
