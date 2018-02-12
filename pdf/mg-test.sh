#!/bin/bash

page_count=$(pdfinfo ${1} | grep Pages | awk '{print $2}')

echo $page_count

