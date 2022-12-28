#!/bin/bash

# This script checks if a DQS key is enabled for HBL lookups

command -v dig >/dev/null 2>&1 || { echo >&2 "The utility dig is required but not present.  Aborting."; exit 1; }

echo -n "Please input your DQS key: "
read DQSKEY
echo -n "Looking up test record for HBL... "
output=`dig +short TV7QRQPGBKF4X3K4T5QYILRI3SP5CIWVIIOH25YUOGVOJ3SBTYNA._cw.$DQSKEY.hbl.dq.spamhaus.net`
echo "done"
if [ "$output" = "127.0.3.20" ]; then
    echo "Your DQS key $DQSKEY is enabled for HBL"
    echo "You can copy sh_hbl.cf and sh_hbl_scores.cf if you want HBL enabled"
else
    echo "Your DQS key $DQSKEY is -=NOT=- enabled for HBL"
    echo "Please *do not* copy sh_hbl.cf and sh_hbl_scores.cf"
fi
