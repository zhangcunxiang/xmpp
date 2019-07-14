%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(memo_change_pass).

-compile(export_all).

do_decode(<<"query">>, <<"memo:change:pass">>, El,
	  Opts) ->
    decode_memo_change_pass(<<"memo:change:pass">>, Opts,
			    El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() -> [{<<"query">>, <<"memo:change:pass">>}].

do_encode({memo_change_pass, _, _, _} = Query,
	  TopXMLNS) ->
    encode_memo_change_pass(Query, TopXMLNS).

do_get_name({memo_change_pass, _, _, _}) -> <<"query">>.

do_get_ns({memo_change_pass, _, _, _}) ->
    <<"memo:change:pass">>.

pp(memo_change_pass, 3) -> [account, newpass, vcode];
pp(_, _) -> no.

records() -> [{memo_change_pass, 3}].

decode_memo_change_pass(__TopXMLNS, __Opts,
			{xmlel, <<"query">>, _attrs, _els}) ->
    {Account, Newpass, Vcode} =
	decode_memo_change_pass_attrs(__TopXMLNS, _attrs,
				      undefined, undefined, undefined),
    {memo_change_pass, Account, Newpass, Vcode}.

decode_memo_change_pass_attrs(__TopXMLNS,
			      [{<<"account">>, _val} | _attrs], _Account,
			      Newpass, Vcode) ->
    decode_memo_change_pass_attrs(__TopXMLNS, _attrs, _val,
				  Newpass, Vcode);
decode_memo_change_pass_attrs(__TopXMLNS,
			      [{<<"newpass">>, _val} | _attrs], Account,
			      _Newpass, Vcode) ->
    decode_memo_change_pass_attrs(__TopXMLNS, _attrs,
				  Account, _val, Vcode);
decode_memo_change_pass_attrs(__TopXMLNS,
			      [{<<"vcode">>, _val} | _attrs], Account, Newpass,
			      _Vcode) ->
    decode_memo_change_pass_attrs(__TopXMLNS, _attrs,
				  Account, Newpass, _val);
decode_memo_change_pass_attrs(__TopXMLNS, [_ | _attrs],
			      Account, Newpass, Vcode) ->
    decode_memo_change_pass_attrs(__TopXMLNS, _attrs,
				  Account, Newpass, Vcode);
decode_memo_change_pass_attrs(__TopXMLNS, [], Account,
			      Newpass, Vcode) ->
    {decode_memo_change_pass_attr_account(__TopXMLNS,
					  Account),
     decode_memo_change_pass_attr_newpass(__TopXMLNS,
					  Newpass),
     decode_memo_change_pass_attr_vcode(__TopXMLNS, Vcode)}.

encode_memo_change_pass({memo_change_pass, Account,
			 Newpass, Vcode},
			__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"memo:change:pass">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = encode_memo_change_pass_attr_vcode(Vcode,
						encode_memo_change_pass_attr_newpass(Newpass,
										     encode_memo_change_pass_attr_account(Account,
															  xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																		     __TopXMLNS)))),
    {xmlel, <<"query">>, _attrs, _els}.

decode_memo_change_pass_attr_account(__TopXMLNS,
				     undefined) ->
    <<>>;
decode_memo_change_pass_attr_account(__TopXMLNS,
				     _val) ->
    _val.

encode_memo_change_pass_attr_account(<<>>, _acc) ->
    _acc;
encode_memo_change_pass_attr_account(_val, _acc) ->
    [{<<"account">>, _val} | _acc].

decode_memo_change_pass_attr_newpass(__TopXMLNS,
				     undefined) ->
    <<>>;
decode_memo_change_pass_attr_newpass(__TopXMLNS,
				     _val) ->
    _val.

encode_memo_change_pass_attr_newpass(<<>>, _acc) ->
    _acc;
encode_memo_change_pass_attr_newpass(_val, _acc) ->
    [{<<"newpass">>, _val} | _acc].

decode_memo_change_pass_attr_vcode(__TopXMLNS,
				   undefined) ->
    <<>>;
decode_memo_change_pass_attr_vcode(__TopXMLNS, _val) ->
    _val.

encode_memo_change_pass_attr_vcode(<<>>, _acc) -> _acc;
encode_memo_change_pass_attr_vcode(_val, _acc) ->
    [{<<"vcode">>, _val} | _acc].
