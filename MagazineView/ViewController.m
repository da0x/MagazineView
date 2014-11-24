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

#import "ViewController.h"
#import "MagazineCollectionView.h"
#import "MagazineCell.h"
#import "MagazineLayout.h"

@interface ViewController ()
@property IBOutlet MagazineCollectionView*   collectionView;
@property IBOutlet MagazineLayout*           layout;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    self.layout = [[MagazineLayout alloc] init];
    self.layout.itemCount = 83;
    
    [self.collectionView setCollectionViewLayout:self.layout];
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collection numberOfItemsInSection:(NSInteger)section
{
    return 83;
}

- (UICollectionViewCell *)collectionView:(MagazineCollectionView *)collection cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MagazineCell *cell          = [collection dequeueReusableCellWithIndexPath:indexPath];
    
    cell.title.text             = @"Lorem ipsum";
    cell.subtitle.text          = @"January, 2013";
    cell.date.text              = @"1 / 1 / 2013";
    
    cell.details.text       = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
    
    NSString *filename = [NSString stringWithFormat:@"insight%ld",(indexPath.row%6)+1];
    cell.image.image = [UIImage imageNamed:filename];
    
    // Cell Background Color
    [cell setBackgroundColor:[self randomColor]];
    
    return cell;
}

- (UIColor*)randomColor
{
    CGFloat hue         = ( arc4random() % 256 / 256.0 );        //  0.0 to 1.0
    CGFloat saturation  = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness  = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color      = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}

@end
