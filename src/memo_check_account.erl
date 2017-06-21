%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(memo_check_account).

-compile(export_all).

do_decode(<<"query">>, <<"memo:check:account">>, El,
	  Opts) ->
    decode_memo_check_account(<<"memo:check:account">>,
			      Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() -> [{<<"query">>, <<"memo:check:account">>}].

do_encode({memo_check_account, _, _, _} = Query,
	  TopXMLNS) ->
    encode_memo_check_account(Query, TopXMLNS).

do_get_name({memo_check_account, _, _, _}) ->
    <<"query">>.

do_get_ns({memo_check_account, _, _, _}) ->
    <<"memo:check:account">>.

pp(memo_check_account, 3) -> [account, server, exist];
pp(_, _) -> no.

records() -> [{memo_check_account, 3}].

decode_memo_check_account(__TopXMLNS, __Opts,
			  {xmlel, <<"query">>, _attrs, _els}) ->
    {Account, Server, Exist} =
	decode_memo_check_account_attrs(__TopXMLNS, _attrs,
					undefined, undefined, undefined),
    {memo_check_account, Account, Server, Exist}.

decode_memo_check_account_attrs(__TopXMLNS,
				[{<<"account">>, _val} | _attrs], _Account,
				Server, Exist) ->
    decode_memo_check_account_attrs(__TopXMLNS, _attrs,
				    _val, Server, Exist);
decode_memo_check_account_attrs(__TopXMLNS,
				[{<<"server">>, _val} | _attrs], Account,
				_Server, Exist) ->
    decode_memo_check_account_attrs(__TopXMLNS, _attrs,
				    Account, _val, Exist);
decode_memo_check_account_attrs(__TopXMLNS,
				[{<<"exist">>, _val} | _attrs], Account, Server,
				_Exist) ->
    decode_memo_check_account_attrs(__TopXMLNS, _attrs,
				    Account, Server, _val);
decode_memo_check_account_attrs(__TopXMLNS,
				[_ | _attrs], Account, Server, Exist) ->
    decode_memo_check_account_attrs(__TopXMLNS, _attrs,
				    Account, Server, Exist);
decode_memo_check_account_attrs(__TopXMLNS, [], Account,
				Server, Exist) ->
    {decode_memo_check_account_attr_account(__TopXMLNS,
					    Account),
     decode_memo_check_account_attr_server(__TopXMLNS,
					   Server),
     decode_memo_check_account_attr_exist(__TopXMLNS,
					  Exist)}.

encode_memo_check_account({memo_check_account, Account,
			   Server, Exist},
			  __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"memo:check:account">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_memo_check_account_attr_exist(Exist,
						  encode_memo_check_account_attr_server(Server,
											encode_memo_check_account_attr_account(Account,
															       xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																			  __TopXMLNS)))),
    {xmlel, <<"query">>, _attrs, _els}.

decode_memo_check_account_attr_account(__TopXMLNS,
				       undefined) ->
    <<>>;
decode_memo_check_account_attr_account(__TopXMLNS,
				       _val) ->
    _val.

encode_memo_check_account_attr_account(<<>>, _acc) ->
    _acc;
encode_memo_check_account_attr_account(_val, _acc) ->
    [{<<"account">>, _val} | _acc].

decode_memo_check_account_attr_server(__TopXMLNS,
				      undefined) ->
    <<>>;
decode_memo_check_account_attr_server(__TopXMLNS,
				      _val) ->
    _val.

encode_memo_check_account_attr_server(<<>>, _acc) ->
    _acc;
encode_memo_check_account_attr_server(_val, _acc) ->
    [{<<"server">>, _val} | _acc].

decode_memo_check_account_attr_exist(__TopXMLNS,
				     undefined) ->
    <<>>;
decode_memo_check_account_attr_exist(__TopXMLNS,
				     _val) ->
    _val.

encode_memo_check_account_attr_exist(<<>>, _acc) ->
    _acc;
encode_memo_check_account_attr_exist(_val, _acc) ->
    [{<<"exist">>, _val} | _acc].
