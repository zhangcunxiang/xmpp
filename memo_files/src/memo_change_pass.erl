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

do_encode({memo_change_pass, _, _, _, _, _} = Query,
	  TopXMLNS) ->
    encode_memo_change_pass(Query, TopXMLNS).

do_get_name({memo_change_pass, _, _, _, _, _}) ->
    <<"query">>.

do_get_ns({memo_change_pass, _, _, _, _, _}) ->
    <<"memo:change:pass">>.

pp(memo_change_pass, 5) ->
    [account, newpass, vcode, phone_number, country_code];
pp(_, _) -> no.

records() -> [{memo_change_pass, 5}].

decode_memo_change_pass(__TopXMLNS, __Opts,
			{xmlel, <<"query">>, _attrs, _els}) ->
    {Account, Newpass, Vcode, Phone_number, Country_code} =
	decode_memo_change_pass_attrs(__TopXMLNS, _attrs,
				      undefined, undefined, undefined,
				      undefined, undefined),
    {memo_change_pass, Account, Newpass, Vcode,
     Phone_number, Country_code}.

decode_memo_change_pass_attrs(__TopXMLNS,
			      [{<<"account">>, _val} | _attrs], _Account,
			      Newpass, Vcode, Phone_number, Country_code) ->
    decode_memo_change_pass_attrs(__TopXMLNS, _attrs, _val,
				  Newpass, Vcode, Phone_number, Country_code);
decode_memo_change_pass_attrs(__TopXMLNS,
			      [{<<"newpass">>, _val} | _attrs], Account,
			      _Newpass, Vcode, Phone_number, Country_code) ->
    decode_memo_change_pass_attrs(__TopXMLNS, _attrs,
				  Account, _val, Vcode, Phone_number,
				  Country_code);
decode_memo_change_pass_attrs(__TopXMLNS,
			      [{<<"vcode">>, _val} | _attrs], Account, Newpass,
			      _Vcode, Phone_number, Country_code) ->
    decode_memo_change_pass_attrs(__TopXMLNS, _attrs,
				  Account, Newpass, _val, Phone_number,
				  Country_code);
decode_memo_change_pass_attrs(__TopXMLNS,
			      [{<<"phone_number">>, _val} | _attrs], Account,
			      Newpass, Vcode, _Phone_number, Country_code) ->
    decode_memo_change_pass_attrs(__TopXMLNS, _attrs,
				  Account, Newpass, Vcode, _val, Country_code);
decode_memo_change_pass_attrs(__TopXMLNS,
			      [{<<"country_code">>, _val} | _attrs], Account,
			      Newpass, Vcode, Phone_number, _Country_code) ->
    decode_memo_change_pass_attrs(__TopXMLNS, _attrs,
				  Account, Newpass, Vcode, Phone_number, _val);
decode_memo_change_pass_attrs(__TopXMLNS, [_ | _attrs],
			      Account, Newpass, Vcode, Phone_number,
			      Country_code) ->
    decode_memo_change_pass_attrs(__TopXMLNS, _attrs,
				  Account, Newpass, Vcode, Phone_number,
				  Country_code);
decode_memo_change_pass_attrs(__TopXMLNS, [], Account,
			      Newpass, Vcode, Phone_number, Country_code) ->
    {decode_memo_change_pass_attr_account(__TopXMLNS,
					  Account),
     decode_memo_change_pass_attr_newpass(__TopXMLNS,
					  Newpass),
     decode_memo_change_pass_attr_vcode(__TopXMLNS, Vcode),
     decode_memo_change_pass_attr_phone_number(__TopXMLNS,
					       Phone_number),
     decode_memo_change_pass_attr_country_code(__TopXMLNS,
					       Country_code)}.

encode_memo_change_pass({memo_change_pass, Account,
			 Newpass, Vcode, Phone_number, Country_code},
			__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"memo:change:pass">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs =
	encode_memo_change_pass_attr_country_code(Country_code,
						  encode_memo_change_pass_attr_phone_number(Phone_number,
											    encode_memo_change_pass_attr_vcode(Vcode,
															       encode_memo_change_pass_attr_newpass(Newpass,
																				    encode_memo_change_pass_attr_account(Account,
																									 xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																												    __TopXMLNS)))))),
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

decode_memo_change_pass_attr_phone_number(__TopXMLNS,
					  undefined) ->
    <<>>;
decode_memo_change_pass_attr_phone_number(__TopXMLNS,
					  _val) ->
    _val.

encode_memo_change_pass_attr_phone_number(<<>>, _acc) ->
    _acc;
encode_memo_change_pass_attr_phone_number(_val, _acc) ->
    [{<<"phone_number">>, _val} | _acc].

decode_memo_change_pass_attr_country_code(__TopXMLNS,
					  undefined) ->
    <<>>;
decode_memo_change_pass_attr_country_code(__TopXMLNS,
					  _val) ->
    _val.

encode_memo_change_pass_attr_country_code(<<>>, _acc) ->
    _acc;
encode_memo_change_pass_attr_country_code(_val, _acc) ->
    [{<<"country_code">>, _val} | _acc].
