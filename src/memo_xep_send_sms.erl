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

do_encode({memo_send_sms, _} = Query, TopXMLNS) ->
    encode_memo_send_sms(Query, TopXMLNS).

do_get_name({memo_send_sms, _}) -> <<"query">>.

do_get_ns({memo_send_sms, _}) ->
    <<"jabber:memo:send:sms">>.

pp(memo_send_sms, 1) -> [account];
pp(_, _) -> no.

records() -> [{memo_send_sms, 1}].

decode_memo_send_sms(__TopXMLNS, __Opts,
		     {xmlel, <<"query">>, _attrs, _els}) ->
    Account = decode_memo_send_sms_attrs(__TopXMLNS, _attrs,
					 undefined),
    {memo_send_sms, Account}.

decode_memo_send_sms_attrs(__TopXMLNS,
			   [{<<"account">>, _val} | _attrs], _Account) ->
    decode_memo_send_sms_attrs(__TopXMLNS, _attrs, _val);
decode_memo_send_sms_attrs(__TopXMLNS, [_ | _attrs],
			   Account) ->
    decode_memo_send_sms_attrs(__TopXMLNS, _attrs, Account);
decode_memo_send_sms_attrs(__TopXMLNS, [], Account) ->
    decode_memo_send_sms_attr_account(__TopXMLNS, Account).

encode_memo_send_sms({memo_send_sms, Account},
		     __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:memo:send:sms">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_memo_send_sms_attr_account(Account,
					       xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									  __TopXMLNS)),
    {xmlel, <<"query">>, _attrs, _els}.

decode_memo_send_sms_attr_account(__TopXMLNS,
				  undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"account">>, <<"query">>,
		   __TopXMLNS}});
decode_memo_send_sms_attr_account(__TopXMLNS, _val) ->
    _val.

encode_memo_send_sms_attr_account(_val, _acc) ->
    [{<<"account">>, _val} | _acc].
