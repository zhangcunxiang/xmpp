%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(memo_xep_check_sms_login_code).

-compile(export_all).

do_decode(<<"query">>,
	  <<"jabber:memo:check:sms:login:code">>, El, Opts) ->
    decode_memo_check_sms_login_code(<<"jabber:memo:check:sms:login:code">>,
				     Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"query">>, <<"jabber:memo:check:sms:login:code">>}].

do_encode({memo_check_sms_login_code, _, _, _, _} =
	      Query,
	  TopXMLNS) ->
    encode_memo_check_sms_login_code(Query, TopXMLNS).

do_get_name({memo_check_sms_login_code, _, _, _, _}) ->
    <<"query">>.

do_get_ns({memo_check_sms_login_code, _, _, _, _}) ->
    <<"jabber:memo:check:sms:login:code">>.

pp(memo_check_sms_login_code, 4) ->
    [user, host, code, pass];
pp(_, _) -> no.

records() -> [{memo_check_sms_login_code, 4}].

decode_memo_check_sms_login_code(__TopXMLNS, __Opts,
				 {xmlel, <<"query">>, _attrs, _els}) ->
    {User, Host, Code, Pass} =
	decode_memo_check_sms_login_code_attrs(__TopXMLNS,
					       _attrs, undefined, undefined,
					       undefined, undefined),
    {memo_check_sms_login_code, User, Host, Code, Pass}.

decode_memo_check_sms_login_code_attrs(__TopXMLNS,
				       [{<<"user">>, _val} | _attrs], _User,
				       Host, Code, Pass) ->
    decode_memo_check_sms_login_code_attrs(__TopXMLNS,
					   _attrs, _val, Host, Code, Pass);
decode_memo_check_sms_login_code_attrs(__TopXMLNS,
				       [{<<"host">>, _val} | _attrs], User,
				       _Host, Code, Pass) ->
    decode_memo_check_sms_login_code_attrs(__TopXMLNS,
					   _attrs, User, _val, Code, Pass);
decode_memo_check_sms_login_code_attrs(__TopXMLNS,
				       [{<<"code">>, _val} | _attrs], User,
				       Host, _Code, Pass) ->
    decode_memo_check_sms_login_code_attrs(__TopXMLNS,
					   _attrs, User, Host, _val, Pass);
decode_memo_check_sms_login_code_attrs(__TopXMLNS,
				       [{<<"pass">>, _val} | _attrs], User,
				       Host, Code, _Pass) ->
    decode_memo_check_sms_login_code_attrs(__TopXMLNS,
					   _attrs, User, Host, Code, _val);
decode_memo_check_sms_login_code_attrs(__TopXMLNS,
				       [_ | _attrs], User, Host, Code, Pass) ->
    decode_memo_check_sms_login_code_attrs(__TopXMLNS,
					   _attrs, User, Host, Code, Pass);
decode_memo_check_sms_login_code_attrs(__TopXMLNS, [],
				       User, Host, Code, Pass) ->
    {decode_memo_check_sms_login_code_attr_user(__TopXMLNS,
						User),
     decode_memo_check_sms_login_code_attr_host(__TopXMLNS,
						Host),
     decode_memo_check_sms_login_code_attr_code(__TopXMLNS,
						Code),
     decode_memo_check_sms_login_code_attr_pass(__TopXMLNS,
						Pass)}.

encode_memo_check_sms_login_code({memo_check_sms_login_code,
				  User, Host, Code, Pass},
				 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:memo:check:sms:login:code">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs =
	encode_memo_check_sms_login_code_attr_pass(Pass,
						   encode_memo_check_sms_login_code_attr_code(Code,
											      encode_memo_check_sms_login_code_attr_host(Host,
																	 encode_memo_check_sms_login_code_attr_user(User,
																						    xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																									       __TopXMLNS))))),
    {xmlel, <<"query">>, _attrs, _els}.

decode_memo_check_sms_login_code_attr_user(__TopXMLNS,
					   undefined) ->
    <<>>;
decode_memo_check_sms_login_code_attr_user(__TopXMLNS,
					   _val) ->
    _val.

encode_memo_check_sms_login_code_attr_user(<<>>,
					   _acc) ->
    _acc;
encode_memo_check_sms_login_code_attr_user(_val,
					   _acc) ->
    [{<<"user">>, _val} | _acc].

decode_memo_check_sms_login_code_attr_host(__TopXMLNS,
					   undefined) ->
    <<>>;
decode_memo_check_sms_login_code_attr_host(__TopXMLNS,
					   _val) ->
    _val.

encode_memo_check_sms_login_code_attr_host(<<>>,
					   _acc) ->
    _acc;
encode_memo_check_sms_login_code_attr_host(_val,
					   _acc) ->
    [{<<"host">>, _val} | _acc].

decode_memo_check_sms_login_code_attr_code(__TopXMLNS,
					   undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"code">>, <<"query">>, __TopXMLNS}});
decode_memo_check_sms_login_code_attr_code(__TopXMLNS,
					   _val) ->
    _val.

encode_memo_check_sms_login_code_attr_code(_val,
					   _acc) ->
    [{<<"code">>, _val} | _acc].

decode_memo_check_sms_login_code_attr_pass(__TopXMLNS,
					   undefined) ->
    <<>>;
decode_memo_check_sms_login_code_attr_pass(__TopXMLNS,
					   _val) ->
    _val.

encode_memo_check_sms_login_code_attr_pass(<<>>,
					   _acc) ->
    _acc;
encode_memo_check_sms_login_code_attr_pass(_val,
					   _acc) ->
    [{<<"pass">>, _val} | _acc].
