//
//   Copyright 2013 Daher Alfawares
//
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.
//

#import "MagazineLayout.h"

@interface MagazineLayout()
@property UIView* layoutView;
@end
@implementation MagazineLayout

-(id)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if( self )
    {
        [self initialize];
    }
    return self;
}

-(void)initialize
{
    self.layoutView = [[[NSBundle mainBundle] loadNibNamed:@"MagazineLayout" owner:self options:nil] objectAtIndex:0];
}

-(CGSize)collectionViewContentSize
{
    if( self.itemCount == 0 )
        return CGSizeZero;
    
    float w = [self rowWidth];
    float h = [self rowHeight];
    int   x = [self itemCount];
    float c = MagazineLayoutsPerRow;
    
    float height = (h/c * ( x + (c/2) - ( x % (int)(c/2) ) ) );
    CGSize contentSize = { w, height };
    return contentSize;
}

-(CGRect)frameForLayoutType:(MagazineLayoutType)type
{
    UIView* cell = [self.layoutView.subviews objectAtIndex:type];
    
    return cell.frame;
}

-(float)rowWidth
{
    return self.layoutView.frame.size.width;
}

-(float)rowHeight
{
    return self.layoutView.frame.size.height;
}

-(MagazineLayoutType)layoutTypeForIndexPath:(NSIndexPath*)indexPath
{
    return indexPath.row % MagazineLayoutsPerRow;
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray* array = [[NSMutableArray alloc] init];
    
    for( int i=0, size = self.itemCount; i< size; i++ )
    {
        UICollectionViewLayoutAttributes* attributes = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        if( CGRectIntersectsRect( attributes.frame, rect) )
            [array addObject:attributes];
    }
    
    return [NSArray arrayWithArray:array];
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect frame = [self frameForLayoutType:[self layoutTypeForIndexPath:indexPath]];
    
    long row = indexPath.row / MagazineLayoutsPerRow;
    frame.origin.y += row * [self rowHeight];
    
    UICollectionViewLayoutAttributes* attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    attributes.frame = frame;
    
    return attributes;
}

-(UICollectionViewScrollDirection)scrollDirection
{
    return UICollectionViewScrollDirectionVertical;
}

@end
