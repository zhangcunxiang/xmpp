%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(memo_xep_send_sms).

-compile(export_all).

do_decode(<<"query">>, <<"jabber:memo:send:sms">>, El,
	  Opts) ->
    decode_memo_send_sms(<<"jabber:memo:send:sms">>, Opts,
			 El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() -> [{<<"query">>, <<"jabber:memo:send:sms">>}].

do_encode({memo_send_sms, _, _, _} = Query, TopXMLNS) ->
    encode_memo_send_sms(Query, TopXMLNS).

do_get_name({memo_send_sms, _, _, _}) -> <<"query">>.

do_get_ns({memo_send_sms, _, _, _}) ->
    <<"jabber:memo:send:sms">>.

pp(memo_send_sms, 3) ->
    [country_code, phone_number, lang];
pp(_, _) -> no.

records() -> [{memo_send_sms, 3}].

decode_memo_send_sms(__TopXMLNS, __Opts,
		     {xmlel, <<"query">>, _attrs, _els}) ->
    {Country_code, Phone_number, Lang} =
	decode_memo_send_sms_attrs(__TopXMLNS, _attrs,
				   undefined, undefined, undefined),
    {memo_send_sms, Country_code, Phone_number, Lang}.

decode_memo_send_sms_attrs(__TopXMLNS,
			   [{<<"country_code">>, _val} | _attrs], _Country_code,
			   Phone_number, Lang) ->
    decode_memo_send_sms_attrs(__TopXMLNS, _attrs, _val,
			       Phone_number, Lang);
decode_memo_send_sms_attrs(__TopXMLNS,
			   [{<<"phone_number">>, _val} | _attrs], Country_code,
			   _Phone_number, Lang) ->
    decode_memo_send_sms_attrs(__TopXMLNS, _attrs,
			       Country_code, _val, Lang);
decode_memo_send_sms_attrs(__TopXMLNS,
			   [{<<"lang">>, _val} | _attrs], Country_code,
			   Phone_number, _Lang) ->
    decode_memo_send_sms_attrs(__TopXMLNS, _attrs,
			       Country_code, Phone_number, _val);
decode_memo_send_sms_attrs(__TopXMLNS, [_ | _attrs],
			   Country_code, Phone_number, Lang) ->
    decode_memo_send_sms_attrs(__TopXMLNS, _attrs,
			       Country_code, Phone_number, Lang);
decode_memo_send_sms_attrs(__TopXMLNS, [], Country_code,
			   Phone_number, Lang) ->
    {decode_memo_send_sms_attr_country_code(__TopXMLNS,
					    Country_code),
     decode_memo_send_sms_attr_phone_number(__TopXMLNS,
					    Phone_number),
     decode_memo_send_sms_attr_lang(__TopXMLNS, Lang)}.

encode_memo_send_sms({memo_send_sms, Country_code,
		      Phone_number, Lang},
		     __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:memo:send:sms">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_memo_send_sms_attr_lang(Lang,
					    encode_memo_send_sms_attr_phone_number(Phone_number,
										   encode_memo_send_sms_attr_country_code(Country_code,
															  xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																		     __TopXMLNS)))),
    {xmlel, <<"query">>, _attrs, _els}.

decode_memo_send_sms_attr_country_code(__TopXMLNS,
				       undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"country_code">>, <<"query">>,
		   __TopXMLNS}});
decode_memo_send_sms_attr_country_code(__TopXMLNS,
				       _val) ->
    _val.

encode_memo_send_sms_attr_country_code(_val, _acc) ->
    [{<<"country_code">>, _val} | _acc].

decode_memo_send_sms_attr_phone_number(__TopXMLNS,
				       undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"phone_number">>, <<"query">>,
		   __TopXMLNS}});
decode_memo_send_sms_attr_phone_number(__TopXMLNS,
				       _val) ->
    _val.

encode_memo_send_sms_attr_phone_number(_val, _acc) ->
    [{<<"phone_number">>, _val} | _acc].

decode_memo_send_sms_attr_lang(__TopXMLNS, undefined) ->
    <<>>;
decode_memo_send_sms_attr_lang(__TopXMLNS, _val) ->
    _val.

encode_memo_send_sms_attr_lang(<<>>, _acc) -> _acc;
encode_memo_send_sms_attr_lang(_val, _acc) ->
    [{<<"lang">>, _val} | _acc].
