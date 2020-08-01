#!/bin/bash


test -f specs/xmpp_codec.spec_old || cp specs/xmpp_codec.spec specs/xmpp_codec.spec_old
# test -f include/xmpp_codec.hrl_old || cp include/xmpp_codec.hrl include/xmpp_codec.hrl_old
cat specs/memo_extend.spec >> specs/xmpp_codec.spec
make all &&
make spec &&
test -d memo_files/src || mkdir -p memo_files/src && cp src/memo* memo_files/src/ &&
test -d memo_files/include || mkdir -p memo_files/include &&
echo -e "%% This file was generated automatically by inject_memo.sh script\n\n" > memo_files/include/xmpp_codec.hrl &&
cat include/xmpp_codec.hrl >> memo_files/include/xmpp_codec.hrl
cp specs/xmpp_codec.spec_old specs/xmpp_codec.spec &&
# cp include/xmpp_codec.hrl_old include/xmpp_codec.hrl
echo "done."