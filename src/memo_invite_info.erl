%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(memo_invite_info).

-compile(export_all).

do_decode(<<"query">>, <<"memo:invite:info">>, El,
	  Opts) ->
    decode_memo_invite_info(<<"memo:invite:info">>, Opts,
			    El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() -> [{<<"query">>, <<"memo:invite:info">>}].

do_encode({memo_invite_info, _, _, _} = Query,
	  TopXMLNS) ->
    encode_memo_invite_info(Query, TopXMLNS).

do_get_name({memo_invite_info, _, _, _}) -> <<"query">>.

do_get_ns({memo_invite_info, _, _, _}) ->
    <<"memo:invite:info">>.

pp(memo_invite_info, 3) ->
    [beinviteds, invite_num, success_num];
pp(_, _) -> no.

records() -> [{memo_invite_info, 3}].

decode_memo_invite_info(__TopXMLNS, __Opts,
			{xmlel, <<"query">>, _attrs, _els}) ->
    {Beinviteds, Invite_num, Success_num} =
	decode_memo_invite_info_attrs(__TopXMLNS, _attrs,
				      undefined, undefined, undefined),
    {memo_invite_info, Beinviteds, Invite_num, Success_num}.

decode_memo_invite_info_attrs(__TopXMLNS,
			      [{<<"beinviteds">>, _val} | _attrs], _Beinviteds,
			      Invite_num, Success_num) ->
    decode_memo_invite_info_attrs(__TopXMLNS, _attrs, _val,
				  Invite_num, Success_num);
decode_memo_invite_info_attrs(__TopXMLNS,
			      [{<<"invite_num">>, _val} | _attrs], Beinviteds,
			      _Invite_num, Success_num) ->
    decode_memo_invite_info_attrs(__TopXMLNS, _attrs,
				  Beinviteds, _val, Success_num);
decode_memo_invite_info_attrs(__TopXMLNS,
			      [{<<"success_num">>, _val} | _attrs], Beinviteds,
			      Invite_num, _Success_num) ->
    decode_memo_invite_info_attrs(__TopXMLNS, _attrs,
				  Beinviteds, Invite_num, _val);
decode_memo_invite_info_attrs(__TopXMLNS, [_ | _attrs],
			      Beinviteds, Invite_num, Success_num) ->
    decode_memo_invite_info_attrs(__TopXMLNS, _attrs,
				  Beinviteds, Invite_num, Success_num);
decode_memo_invite_info_attrs(__TopXMLNS, [],
			      Beinviteds, Invite_num, Success_num) ->
    {decode_memo_invite_info_attr_beinviteds(__TopXMLNS,
					     Beinviteds),
     decode_memo_invite_info_attr_invite_num(__TopXMLNS,
					     Invite_num),
     decode_memo_invite_info_attr_success_num(__TopXMLNS,
					      Success_num)}.

encode_memo_invite_info({memo_invite_info, Beinviteds,
			 Invite_num, Success_num},
			__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"memo:invite:info">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs =
	encode_memo_invite_info_attr_success_num(Success_num,
						 encode_memo_invite_info_attr_invite_num(Invite_num,
											 encode_memo_invite_info_attr_beinviteds(Beinviteds,
																 xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																			    __TopXMLNS)))),
    {xmlel, <<"query">>, _attrs, _els}.

decode_memo_invite_info_attr_beinviteds(__TopXMLNS,
					undefined) ->
    <<>>;
decode_memo_invite_info_attr_beinviteds(__TopXMLNS,
					_val) ->
    _val.

encode_memo_invite_info_attr_beinviteds(<<>>, _acc) ->
    _acc;
encode_memo_invite_info_attr_beinviteds(_val, _acc) ->
    [{<<"beinviteds">>, _val} | _acc].

decode_memo_invite_info_attr_invite_num(__TopXMLNS,
					undefined) ->
    <<>>;
decode_memo_invite_info_attr_invite_num(__TopXMLNS,
					_val) ->
    _val.

encode_memo_invite_info_attr_invite_num(<<>>, _acc) ->
    _acc;
encode_memo_invite_info_attr_invite_num(_val, _acc) ->
    [{<<"invite_num">>, _val} | _acc].

decode_memo_invite_info_attr_success_num(__TopXMLNS,
					 undefined) ->
    <<>>;
decode_memo_invite_info_attr_success_num(__TopXMLNS,
					 _val) ->
    _val.

encode_memo_invite_info_attr_success_num(<<>>, _acc) ->
    _acc;
encode_memo_invite_info_attr_success_num(_val, _acc) ->
    [{<<"success_num">>, _val} | _acc].
