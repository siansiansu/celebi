#!/bin/bash

GITROOT="$(git rev-parse --show-toplevel)"
TMPDIR="$GITROOT"/tmp
TEXTFILE="$TMPDIR"/tweet
DATEFILE="$TMPDIR"/date

mkdir -p "$TMPDIR"

curl -s --location --request GET 'https://api.twitter.com/2/tweets/search/recent?query=from:VImTipsDaily&tweet.fields=created_at' \
--header 'Authorization: Bearer AAAAAAAAAAAAAAAAAAAAAGXYMwEAAAAA%2BJH%2FWYTs%2BnCZ4TpWunwWkJ53TCo%3D3ZicrDonVbn0wCI6YoPFvBVYPc1BrI9K2x4BpgRcCHk5cIKiQA' \
--header 'Cookie: guest_id=v1%3A161385324174009187; personalization_id="v1_HiDAkl8Q2SyerV7ou/Sx9g=="' | jq -r '.data[].text' > "$TMPDIR"/tweet

curl -s --location --request GET 'https://api.twitter.com/2/tweets/search/recent?query=from:VImTipsDaily&tweet.fields=created_at' \
--header 'Authorization: Bearer AAAAAAAAAAAAAAAAAAAAAGXYMwEAAAAA%2BJH%2FWYTs%2BnCZ4TpWunwWkJ53TCo%3D3ZicrDonVbn0wCI6YoPFvBVYPc1BrI9K2x4BpgRcCHk5cIKiQA' \
--header 'Cookie: guest_id=v1%3A161385324174009187; personalization_id="v1_HiDAkl8Q2SyerV7ou/Sx9g=="' | jq -r '.data[].created_at' > "$TMPDIR"/date


count=$(curl -s --location --request GET 'https://api.twitter.com/2/tweets/search/recent?query=from:VImTipsDaily&tweet.fields=created_at' \
--header 'Authorization: Bearer AAAAAAAAAAAAAAAAAAAAAGXYMwEAAAAA%2BJH%2FWYTs%2BnCZ4TpWunwWkJ53TCo%3D3ZicrDonVbn0wCI6YoPFvBVYPc1BrI9K2x4BpgRcCHk5cIKiQA' \
--header 'Cookie: guest_id=v1%3A161385324174009187; personalization_id="v1_HiDAkl8Q2SyerV7ou/Sx9g=="' | jq -r '.meta.result_count')

for (( i=1; i <= $count; ++i ))
do
  text=$(head -"$i" $TEXTFILE | tail +"$i" | cat)
  date=$(head -"$i" $DATEFILE | tail +"$i" | cut -c1-10 | cat)

  mkdir -p $GITROOT/content/posts/$date

cat << EOF > $GITROOT/content/posts/$date/vim-tips-daily.md
---
title: "Today's Vim Tip"
date: $date
tags:
  - vim
  - neovim
  - VImTipsDaily
categories: vim
draft: false
hideDate: true
---

$text

> This post is auto shared from [VImTipsDaily](https://twitter.com/VImTipsDaily) by GitHub Action
EOF

done

