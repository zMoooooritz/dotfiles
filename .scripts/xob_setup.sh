#!/bin/bash

mkfifo /tmp/volpipe
tail -f /tmp/volpipe | xob -s mid
