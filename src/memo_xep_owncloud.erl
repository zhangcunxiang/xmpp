%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(memo_xep_owncloud).

-compile(export_all).

do_decode(<<"query">>, <<"jabber:memo:owncloud">>, El,
	  Opts) ->
    decode_memo_owncloud(<<"jabber:memo:owncloud">>, Opts,
			 El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() -> [{<<"query">>, <<"jabber:memo:owncloud">>}].

do_encode({memo_owncloud, _, _, _} = Query, TopXMLNS) ->
    encode_memo_owncloud(Query, TopXMLNS).

do_get_name({memo_owncloud, _, _, _}) -> <<"query">>.

do_get_ns({memo_owncloud, _, _, _}) ->
    <<"jabber:memo:owncloud">>.

pp(memo_owncloud, 3) ->
    [rtype, watching_user, watching_server];
pp(_, _) -> no.

records() -> [{memo_owncloud, 3}].

decode_memo_owncloud(__TopXMLNS, __Opts,
		     {xmlel, <<"query">>, _attrs, _els}) ->
    {Rtype, Watching_user, Watching_server} =
	decode_memo_owncloud_attrs(__TopXMLNS, _attrs,
				   undefined, undefined, undefined),
    {memo_owncloud, Rtype, Watching_user, Watching_server}.

decode_memo_owncloud_attrs(__TopXMLNS,
			   [{<<"rtype">>, _val} | _attrs], _Rtype,
			   Watching_user, Watching_server) ->
    decode_memo_owncloud_attrs(__TopXMLNS, _attrs, _val,
			       Watching_user, Watching_server);
decode_memo_owncloud_attrs(__TopXMLNS,
			   [{<<"watching_user">>, _val} | _attrs], Rtype,
			   _Watching_user, Watching_server) ->
    decode_memo_owncloud_attrs(__TopXMLNS, _attrs, Rtype,
			       _val, Watching_server);
decode_memo_owncloud_attrs(__TopXMLNS,
			   [{<<"watching_server">>, _val} | _attrs], Rtype,
			   Watching_user, _Watching_server) ->
    decode_memo_owncloud_attrs(__TopXMLNS, _attrs, Rtype,
			       Watching_user, _val);
decode_memo_owncloud_attrs(__TopXMLNS, [_ | _attrs],
			   Rtype, Watching_user, Watching_server) ->
    decode_memo_owncloud_attrs(__TopXMLNS, _attrs, Rtype,
			       Watching_user, Watching_server);
decode_memo_owncloud_attrs(__TopXMLNS, [], Rtype,
			   Watching_user, Watching_server) ->
    {decode_memo_owncloud_attr_rtype(__TopXMLNS, Rtype),
     decode_memo_owncloud_attr_watching_user(__TopXMLNS,
					     Watching_user),
     decode_memo_owncloud_attr_watching_server(__TopXMLNS,
					       Watching_server)}.

encode_memo_owncloud({memo_owncloud, Rtype,
		      Watching_user, Watching_server},
		     __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:memo:owncloud">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs =
	encode_memo_owncloud_attr_watching_server(Watching_server,
						  encode_memo_owncloud_attr_watching_user(Watching_user,
											  encode_memo_owncloud_attr_rtype(Rtype,
															  xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																		     __TopXMLNS)))),
    {xmlel, <<"query">>, _attrs, _els}.

decode_memo_owncloud_attr_rtype(__TopXMLNS,
				undefined) ->
    <<>>;
decode_memo_owncloud_attr_rtype(__TopXMLNS, _val) ->
    _val.

encode_memo_owncloud_attr_rtype(<<>>, _acc) -> _acc;
encode_memo_owncloud_attr_rtype(_val, _acc) ->
    [{<<"rtype">>, _val} | _acc].

decode_memo_owncloud_attr_watching_user(__TopXMLNS,
					undefined) ->
    <<>>;
decode_memo_owncloud_attr_watching_user(__TopXMLNS,
					_val) ->
    _val.

encode_memo_owncloud_attr_watching_user(<<>>, _acc) ->
    _acc;
encode_memo_owncloud_attr_watching_user(_val, _acc) ->
    [{<<"watching_user">>, _val} | _acc].

decode_memo_owncloud_attr_watching_server(__TopXMLNS,
					  undefined) ->
    <<>>;
decode_memo_owncloud_attr_watching_server(__TopXMLNS,
					  _val) ->
    _val.

encode_memo_owncloud_attr_watching_server(<<>>, _acc) ->
    _acc;
encode_memo_owncloud_attr_watching_server(_val, _acc) ->
    [{<<"watching_server">>, _val} | _acc].
