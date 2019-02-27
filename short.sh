
# TinyURL Shortener CLI
# Copyright (C) by Krzysztof Palaiologos Szewczyk.
# Licensed under terms of MIT license.

command -v curl >/dev/null 2>&1 || { echo >&2 "This script requires cURL to be installed. Aborting."; exit 1; }

if [ $# -eq 1 ]; then
  if [ $1 = "-h" ]; then
    # ./short -h
    echo "short - Copyright (C) by Krzysztof Szewczyk."
    echo "License - MIT"
    echo "./short [-h|-v|-a] [url] [alias]"
    echo "Optional parameters:"
    echo " -h, -v, -a, alias"
    echo "Required parameters"
    echo " url"
    echo ""
    echo "-h -> display this message"
    echo "-v -> display version"
    echo "alias-> provide alias."
    echo "url-> URL to shorten"
    exit 5
  else
    if [ $1 = "-v" ]; then
      # ./short -v
      echo "short v1.0 - Copyright (C) by Krzysztof Szewczyk."
      echo "License - MIT"
      exit 4
    else
      # ./short url
      curl "http://tinyurl.com/api-create.php?url=$1" 2> /dev/null
      echo ""
    fi
  fi
else
  if [ $# -eq 2 ]; then
    curl "http://tinyurl.com/api-create.php?url=$1&alias=$2" 2> /dev/null
    echo ""
  else
    echo "short: Expected 1 or 2 parameters. Use -h."
    exit 2
  fi
fi
