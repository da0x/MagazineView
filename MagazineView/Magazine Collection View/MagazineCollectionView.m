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

#import "MagazineCollectionView.h"
#import "MagazineCell.h"
#import "MagazineLayout.h"

@implementation MagazineCollectionView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self registerNibNamed:@"MagazineCellA" forCellWithReuseIdentifier:@"A"];
        [self registerNibNamed:@"MagazineCellB" forCellWithReuseIdentifier:@"B"];
        [self registerNibNamed:@"MagazineCellC" forCellWithReuseIdentifier:@"C"];
        [self registerNibNamed:@"MagazineCellD" forCellWithReuseIdentifier:@"D"];
    }
    return self;
}

- (void)registerNibNamed:(NSString*)nibName forCellWithReuseIdentifier:(NSString*)reuseId
{
    UINib* nib = [UINib nibWithNibName:nibName bundle:[NSBundle mainBundle]];
    
    [self registerNib:nib forCellWithReuseIdentifier:reuseId];
}

-(UICollectionViewCell *)dequeueReusableCellWithIndexPath:(NSIndexPath*)indexPath
{
    return [self dequeueReusableCellWithReuseIdentifier:[self reuseIdentifierForCellWithIndexPath:indexPath] forIndexPath:indexPath];
}

-(NSString*)reuseIdentifierForCellWithIndexPath:(NSIndexPath*)indexPath
{
    NSArray* cells = @[@"A",@"B",@"C",@"D",
                       @"B",@"C",@"D",@"A"];
    return [cells objectAtIndex:(indexPath.row % MagazineLayoutsPerRow)];
}

@end
