#!/usr/bin/env python

import sys
import cv2

from scipy.misc import imread
from scipy.linalg import norm
from scipy import sum, average


def compare_images(img1, img2):
    # normalize to compensate for exposure difference
    img1 = normalize(img1)
    img2 = normalize(img2)
    # calculate the difference and its norms
    diff = img1 - img2  # elementwise for scipy arrays
    m_norm = sum(abs(diff))  # Manhattan norm
    z_norm = norm(diff.ravel(), 0)  # Zero norm
    return (m_norm, z_norm)

def to_grayscale(arr):
    "If arr is a color image (3D array), convert it to grayscale (2D array)."
    if len(arr.shape) == 3:
        return average(arr, -1)  # average over the last axis (color channels)
    else:
        return arr

def normalize(arr):
    rng = arr.max() - arr.min()
    amin = arr.min()

    if rng == 0:
      return arr - amin

    return (arr-amin)*255/rng

# Check for parameter
if len(sys.argv) < 2:
  print('Please pass argument.')
  exit()

# Reading Video
vidcap = cv2.VideoCapture(sys.argv[1])


# Variables
count = 0
last_image = None

# Loop
while True:
  success, image = vidcap.read()
  if success == False:
    break

  if last_image is None:
    cv2.imwrite("frame%d.jpg" % count, image)     # save frame as JPEG file
    print("frame%d.jpg saved." % count)
    last_image = image
    count += 1
    continue

  img1 = to_grayscale(image.astype(float))
  img2 = to_grayscale(last_image.astype(float))
  n_m, n_0 = compare_images(img1, img2)

  if (n_m * 1.0 / img1.size) < 1 and (n_0 * 1.0 / img1.size) < 1:
    continue

  cv2.imwrite("frame%d.jpg" % count, image)     # save frame as JPEG file
  print("frame%d.jpg saved." % count)
  count += 1
  last_image = image

