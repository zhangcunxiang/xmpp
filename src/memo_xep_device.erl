%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(memo_xep_device).

-compile(export_all).

do_decode(<<"query">>, <<"jabber:memo:device">>, El,
	  Opts) ->
    decode_memo_device_info(<<"jabber:memo:device">>, Opts,
			    El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() -> [{<<"query">>, <<"jabber:memo:device">>}].

do_encode({memo_device_info, _, _, _, _, _, _, _, _} =
	      Query,
	  TopXMLNS) ->
    encode_memo_device_info(Query, TopXMLNS).

do_get_name({memo_device_info, _, _, _, _, _, _, _,
	     _}) ->
    <<"query">>.

do_get_ns({memo_device_info, _, _, _, _, _, _, _, _}) ->
    <<"jabber:memo:device">>.

pp(memo_device_info, 8) ->
    [user, server, device_type, token, language,
     device_number, domain_key, is_debug];
pp(_, _) -> no.

records() -> [{memo_device_info, 8}].

decode_memo_device_info(__TopXMLNS, __Opts,
			{xmlel, <<"query">>, _attrs, _els}) ->
    {User, Server, Device_type, Token, Language, Domain_key,
     Is_debug, Device_number} =
	decode_memo_device_info_attrs(__TopXMLNS, _attrs,
				      undefined, undefined, undefined,
				      undefined, undefined, undefined,
				      undefined, undefined),
    {memo_device_info, User, Server, Device_type, Token,
     Language, Device_number, Domain_key, Is_debug}.

decode_memo_device_info_attrs(__TopXMLNS,
			      [{<<"user">>, _val} | _attrs], _User, Server,
			      Device_type, Token, Language, Domain_key,
			      Is_debug, Device_number) ->
    decode_memo_device_info_attrs(__TopXMLNS, _attrs, _val,
				  Server, Device_type, Token, Language,
				  Domain_key, Is_debug, Device_number);
decode_memo_device_info_attrs(__TopXMLNS,
			      [{<<"server">>, _val} | _attrs], User, _Server,
			      Device_type, Token, Language, Domain_key,
			      Is_debug, Device_number) ->
    decode_memo_device_info_attrs(__TopXMLNS, _attrs, User,
				  _val, Device_type, Token, Language,
				  Domain_key, Is_debug, Device_number);
decode_memo_device_info_attrs(__TopXMLNS,
			      [{<<"device_type">>, _val} | _attrs], User,
			      Server, _Device_type, Token, Language, Domain_key,
			      Is_debug, Device_number) ->
    decode_memo_device_info_attrs(__TopXMLNS, _attrs, User,
				  Server, _val, Token, Language, Domain_key,
				  Is_debug, Device_number);
decode_memo_device_info_attrs(__TopXMLNS,
			      [{<<"token">>, _val} | _attrs], User, Server,
			      Device_type, _Token, Language, Domain_key,
			      Is_debug, Device_number) ->
    decode_memo_device_info_attrs(__TopXMLNS, _attrs, User,
				  Server, Device_type, _val, Language,
				  Domain_key, Is_debug, Device_number);
decode_memo_device_info_attrs(__TopXMLNS,
			      [{<<"language">>, _val} | _attrs], User, Server,
			      Device_type, Token, _Language, Domain_key,
			      Is_debug, Device_number) ->
    decode_memo_device_info_attrs(__TopXMLNS, _attrs, User,
				  Server, Device_type, Token, _val, Domain_key,
				  Is_debug, Device_number);
decode_memo_device_info_attrs(__TopXMLNS,
			      [{<<"domain_key">>, _val} | _attrs], User, Server,
			      Device_type, Token, Language, _Domain_key,
			      Is_debug, Device_number) ->
    decode_memo_device_info_attrs(__TopXMLNS, _attrs, User,
				  Server, Device_type, Token, Language, _val,
				  Is_debug, Device_number);
decode_memo_device_info_attrs(__TopXMLNS,
			      [{<<"is_debug">>, _val} | _attrs], User, Server,
			      Device_type, Token, Language, Domain_key,
			      _Is_debug, Device_number) ->
    decode_memo_device_info_attrs(__TopXMLNS, _attrs, User,
				  Server, Device_type, Token, Language,
				  Domain_key, _val, Device_number);
decode_memo_device_info_attrs(__TopXMLNS,
			      [{<<"device_number">>, _val} | _attrs], User,
			      Server, Device_type, Token, Language, Domain_key,
			      Is_debug, _Device_number) ->
    decode_memo_device_info_attrs(__TopXMLNS, _attrs, User,
				  Server, Device_type, Token, Language,
				  Domain_key, Is_debug, _val);
decode_memo_device_info_attrs(__TopXMLNS, [_ | _attrs],
			      User, Server, Device_type, Token, Language,
			      Domain_key, Is_debug, Device_number) ->
    decode_memo_device_info_attrs(__TopXMLNS, _attrs, User,
				  Server, Device_type, Token, Language,
				  Domain_key, Is_debug, Device_number);
decode_memo_device_info_attrs(__TopXMLNS, [], User,
			      Server, Device_type, Token, Language, Domain_key,
			      Is_debug, Device_number) ->
    {decode_memo_device_info_attr_user(__TopXMLNS, User),
     decode_memo_device_info_attr_server(__TopXMLNS, Server),
     decode_memo_device_info_attr_device_type(__TopXMLNS,
					      Device_type),
     decode_memo_device_info_attr_token(__TopXMLNS, Token),
     decode_memo_device_info_attr_language(__TopXMLNS,
					   Language),
     decode_memo_device_info_attr_domain_key(__TopXMLNS,
					     Domain_key),
     decode_memo_device_info_attr_is_debug(__TopXMLNS,
					   Is_debug),
     decode_memo_device_info_attr_device_number(__TopXMLNS,
						Device_number)}.

encode_memo_device_info({memo_device_info, User, Server,
			 Device_type, Token, Language, Device_number,
			 Domain_key, Is_debug},
			__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:memo:device">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs =
	encode_memo_device_info_attr_device_number(Device_number,
						   encode_memo_device_info_attr_is_debug(Is_debug,
											 encode_memo_device_info_attr_domain_key(Domain_key,
																 encode_memo_device_info_attr_language(Language,
																				       encode_memo_device_info_attr_token(Token,
																									  encode_memo_device_info_attr_device_type(Device_type,
																														   encode_memo_device_info_attr_server(Server,
																																		       encode_memo_device_info_attr_user(User,
																																							 xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																																										    __TopXMLNS))))))))),
    {xmlel, <<"query">>, _attrs, _els}.

decode_memo_device_info_attr_user(__TopXMLNS,
				  undefined) ->
    <<>>;
decode_memo_device_info_attr_user(__TopXMLNS, _val) ->
    _val.

encode_memo_device_info_attr_user(<<>>, _acc) -> _acc;
encode_memo_device_info_attr_user(_val, _acc) ->
    [{<<"user">>, _val} | _acc].

decode_memo_device_info_attr_server(__TopXMLNS,
				    undefined) ->
    <<>>;
decode_memo_device_info_attr_server(__TopXMLNS, _val) ->
    _val.

encode_memo_device_info_attr_server(<<>>, _acc) -> _acc;
encode_memo_device_info_attr_server(_val, _acc) ->
    [{<<"server">>, _val} | _acc].

decode_memo_device_info_attr_device_type(__TopXMLNS,
					 undefined) ->
    <<>>;
decode_memo_device_info_attr_device_type(__TopXMLNS,
					 _val) ->
    _val.

encode_memo_device_info_attr_device_type(<<>>, _acc) ->
    _acc;
encode_memo_device_info_attr_device_type(_val, _acc) ->
    [{<<"device_type">>, _val} | _acc].

decode_memo_device_info_attr_token(__TopXMLNS,
				   undefined) ->
    <<>>;
decode_memo_device_info_attr_token(__TopXMLNS, _val) ->
    _val.

encode_memo_device_info_attr_token(<<>>, _acc) -> _acc;
encode_memo_device_info_attr_token(_val, _acc) ->
    [{<<"token">>, _val} | _acc].

decode_memo_device_info_attr_language(__TopXMLNS,
				      undefined) ->
    <<>>;
decode_memo_device_info_attr_language(__TopXMLNS,
				      _val) ->
    _val.

encode_memo_device_info_attr_language(<<>>, _acc) ->
    _acc;
encode_memo_device_info_attr_language(_val, _acc) ->
    [{<<"language">>, _val} | _acc].

decode_memo_device_info_attr_domain_key(__TopXMLNS,
					undefined) ->
    <<>>;
decode_memo_device_info_attr_domain_key(__TopXMLNS,
					_val) ->
    _val.

encode_memo_device_info_attr_domain_key(<<>>, _acc) ->
    _acc;
encode_memo_device_info_attr_domain_key(_val, _acc) ->
    [{<<"domain_key">>, _val} | _acc].

decode_memo_device_info_attr_is_debug(__TopXMLNS,
				      undefined) ->
    <<>>;
decode_memo_device_info_attr_is_debug(__TopXMLNS,
				      _val) ->
    _val.

encode_memo_device_info_attr_is_debug(<<>>, _acc) ->
    _acc;
encode_memo_device_info_attr_is_debug(_val, _acc) ->
    [{<<"is_debug">>, _val} | _acc].

decode_memo_device_info_attr_device_number(__TopXMLNS,
					   undefined) ->
    <<>>;
decode_memo_device_info_attr_device_number(__TopXMLNS,
					   _val) ->
    _val.

encode_memo_device_info_attr_device_number(<<>>,
					   _acc) ->
    _acc;
encode_memo_device_info_attr_device_number(_val,
					   _acc) ->
    [{<<"device_number">>, _val} | _acc].
