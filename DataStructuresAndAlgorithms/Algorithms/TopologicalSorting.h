//
//  TopologicalSorting.h
//  DataStructuresAndAlgorithms
//
//  Created by Alexey Patosin on 22/02/15.
//  Copyright (c) 2015 TestOrg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GraphNode.h"

@interface TopologicalSorting : NSObject

+ (NSArray *)sortWithRootNode:(GraphNode *)rootNode;

@end
