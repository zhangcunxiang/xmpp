%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(memo_xep_topic).

-compile(export_all).

do_decode(<<"query">>, <<"jabber:iq:topic">>, El,
	  Opts) ->
    decode_mod_topic(<<"jabber:iq:topic">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() -> [{<<"query">>, <<"jabber:iq:topic">>}].

do_encode({mod_topic, _, _} = Query, TopXMLNS) ->
    encode_mod_topic(Query, TopXMLNS).

do_get_name({mod_topic, _, _}) -> <<"query">>.

do_get_ns({mod_topic, _, _}) -> <<"jabber:iq:topic">>.

pp(mod_topic, 2) -> [rtype, tid];
pp(_, _) -> no.

records() -> [{mod_topic, 2}].

decode_mod_topic(__TopXMLNS, __Opts,
		 {xmlel, <<"query">>, _attrs, _els}) ->
    {Rtype, Tid} = decode_mod_topic_attrs(__TopXMLNS,
					  _attrs, undefined, undefined),
    {mod_topic, Rtype, Tid}.

decode_mod_topic_attrs(__TopXMLNS,
		       [{<<"rtype">>, _val} | _attrs], _Rtype, Tid) ->
    decode_mod_topic_attrs(__TopXMLNS, _attrs, _val, Tid);
decode_mod_topic_attrs(__TopXMLNS,
		       [{<<"tid">>, _val} | _attrs], Rtype, _Tid) ->
    decode_mod_topic_attrs(__TopXMLNS, _attrs, Rtype, _val);
decode_mod_topic_attrs(__TopXMLNS, [_ | _attrs], Rtype,
		       Tid) ->
    decode_mod_topic_attrs(__TopXMLNS, _attrs, Rtype, Tid);
decode_mod_topic_attrs(__TopXMLNS, [], Rtype, Tid) ->
    {decode_mod_topic_attr_rtype(__TopXMLNS, Rtype),
     decode_mod_topic_attr_tid(__TopXMLNS, Tid)}.

encode_mod_topic({mod_topic, Rtype, Tid}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:topic">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = encode_mod_topic_attr_tid(Tid,
				       encode_mod_topic_attr_rtype(Rtype,
								   xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
											      __TopXMLNS))),
    {xmlel, <<"query">>, _attrs, _els}.

decode_mod_topic_attr_rtype(__TopXMLNS, undefined) ->
    <<>>;
decode_mod_topic_attr_rtype(__TopXMLNS, _val) -> _val.

encode_mod_topic_attr_rtype(<<>>, _acc) -> _acc;
encode_mod_topic_attr_rtype(_val, _acc) ->
    [{<<"rtype">>, _val} | _acc].

decode_mod_topic_attr_tid(__TopXMLNS, undefined) ->
    <<>>;
decode_mod_topic_attr_tid(__TopXMLNS, _val) -> _val.

encode_mod_topic_attr_tid(<<>>, _acc) -> _acc;
encode_mod_topic_attr_tid(_val, _acc) ->
    [{<<"tid">>, _val} | _acc].
