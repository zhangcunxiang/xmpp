%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(memo_xep_jingle).

-compile(export_all).

do_decode(<<"signaling">>, <<"jabber:client">>, El,
	  Opts) ->
    decode_memo_jingle(<<"jabber:client">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() -> [{<<"signaling">>, <<"jabber:client">>}].

do_encode({memo_jingle} = Signaling, TopXMLNS) ->
    encode_memo_jingle(Signaling, TopXMLNS).

do_get_name({memo_jingle}) -> <<"signaling">>.

do_get_ns({memo_jingle}) -> <<"jabber:client">>.

pp(memo_jingle, 0) -> [];
pp(_, _) -> no.

records() -> [{memo_jingle, 0}].

decode_memo_jingle(__TopXMLNS, __Opts,
		   {xmlel, <<"signaling">>, _attrs, _els}) ->
    {memo_jingle}.

encode_memo_jingle({memo_jingle}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:client">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"signaling">>, _attrs, _els}.
