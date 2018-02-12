#!/usr/bin/env python

import argparse
import glob
import cv2

parser = argparse.ArgumentParser(description='Clip image')
parser.add_argument('--pattern', dest='pattern', type=str, nargs=1, required=True, help='FILE')
parser.add_argument('--x', dest='x', type=int, nargs=1, required=True, help='X')
parser.add_argument('--y', dest='y', type=int, nargs=1, required=True, help='Y')
parser.add_argument('--width', dest='width', type=int, nargs=1, required=True, help='WIDTH')
parser.add_argument('--height', dest='height', type=int, nargs=1, required=True, help='HEIGHT')

args = parser.parse_args()
print(args)

pattern = args.pattern[0]
x = args.x[0]
y = args.y[0]
width = args.width[0]
height = args.height[0]

print('pattern:', pattern)
print('X:      ', x)
print('Y:      ', y)
print('Width:  ', width)
print('Height: ', height)


files = glob.glob(pattern)


for file in files:
  image = cv2.imread(file)

  if image is None:
    continue

  crop_image = image[y:y + height, x:x + width]

  cv2.imwrite(file, crop_image)

  print("File clipped: " + file)
