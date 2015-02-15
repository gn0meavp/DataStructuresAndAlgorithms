//
//  Trie.m
//  DataStructuresAndAlgorithms
//
//  Created by Alexey Patosin on 15/02/15.
//  Copyright (c) 2015 TestOrg. All rights reserved.
//

#import "TrieNode.h"

@implementation TrieNode

- (instancetype)init {
    self = [super init];
    if (self) {
        _children = [NSMutableDictionary dictionary];
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ %i", self.letter, self.isEnd];
}

- (void)addWord:(NSString *)word {
    if ([word length] == 0) {
        self.isEnd = YES;
    }
    else {
        NSString *letter = [word substringWithRange:(NSRange){0,1}];
        TrieNode *node = self.children[letter];
        if (node == nil) {
            node = [TrieNode new];
            node.letter = letter;
            self.children[letter] = node;
        }
        
        NSString *substring = [self substringFromIndex_1:word];
        
        [node addWord:substring];
        
    }
}

- (BOOL)containsWord:(NSString *)word {
    
    if ([word length] == 0 && self.isEnd == YES) {
        return YES;
    }
    
    NSString *letter = [word substringToIndex:1];
    TrieNode *node = self.children[letter];
    
    if (node) {
        NSString *substring = [self substringFromIndex_1:word];
        
        return [node containsWord:substring];
    }
    
    return NO;
    
}

- (NSString *)substringFromIndex_1:(NSString *)word {
    NSString *substring = nil;
    
    if ([word length] > 1) {
        substring = [word substringFromIndex:1];
    }
    
    return substring;
}

@end
