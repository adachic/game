//
//  TileMapLayer.m
//  game
//
//  Created by 安達 彰典 on 2013/01/25.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "TileMapLayer.h"


@implementation TileMapLayer

+(id) scene
{
	CCScene *scene = [CCScene node];
	TileMapLayer *layer = [TileMapLayer node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if ((self = [super init]))
	{
		CCTMXTiledMap* tileMap = [CCTMXTiledMap tiledMapWithTMXFile:@"first.tmx"];
		[self addChild:tileMap z:-1 tag:TileMapNode];
		
		// Use a negative offset to set the tilemap's start position
		//tileMap.position = CGPointMake(-160, -120);
		
		// hide the event layer, we only need this information for code, not to display it
		CCTMXLayer* eventLayer = [tileMap layerNamed:@"inside"];
		eventLayer.visible = YES;
		CCTMXLayer* eventLayer2 = [tileMap layerNamed:@"outside"];
		eventLayer2.visible = NO;
		CCTMXLayer* eventLayer3 = [tileMap layerNamed:@"upper"];
		eventLayer3.visible = YES;
	}
	
	return self;
}
@end
