%% Created automatically by XML generator (fxml_gen.erl)
%% Source: memo_codec.spec

-module(memo_xep_message).

-compile(export_all).

do_decode(<<"memo_info">>, <<"jabber:memo:message">>,
	  El, Opts) ->
    decode_memo_info(<<"jabber:memo:message">>, Opts, El);
do_decode(<<"receipt_info">>, <<"jabber:memo:message">>,
	  El, Opts) ->
    decode_receipt_info(<<"jabber:memo:message">>, Opts,
			El);
do_decode(<<"auth_info">>, <<"jabber:memo:message">>,
	  El, Opts) ->
    decode_auth_info(<<"jabber:memo:message">>, Opts, El);
do_decode(<<"chat_info">>, <<"jabber:memo:message">>,
	  El, Opts) ->
    decode_chat_info(<<"jabber:memo:message">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({memo_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({memo_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"memo_info">>, <<"jabber:memo:message">>},
     {<<"receipt_info">>, <<"jabber:memo:message">>},
     {<<"auth_info">>, <<"jabber:memo:message">>},
     {<<"chat_info">>, <<"jabber:memo:message">>}].

do_encode({chat_info, _, _, _, _, _, _, _} = Chat_info,
	  TopXMLNS) ->
    encode_chat_info(Chat_info, TopXMLNS);
do_encode({auth_info, _, _, _, _, _, _, _, _, _, _} =
	      Auth_info,
	  TopXMLNS) ->
    encode_auth_info(Auth_info, TopXMLNS);
do_encode({receipt_info, _, _, _, _, _, _} =
	      Receipt_info,
	  TopXMLNS) ->
    encode_receipt_info(Receipt_info, TopXMLNS);
do_encode({memo_info, _, _, _, _} = Memo_info,
	  TopXMLNS) ->
    encode_memo_info(Memo_info, TopXMLNS).

do_get_name({auth_info, _, _, _, _, _, _, _, _, _,
	     _}) ->
    <<"auth_info">>;
do_get_name({chat_info, _, _, _, _, _, _, _}) ->
    <<"chat_info">>;
do_get_name({memo_info, _, _, _, _}) -> <<"memo_info">>;
do_get_name({receipt_info, _, _, _, _, _, _}) ->
    <<"receipt_info">>.

do_get_ns({auth_info, _, _, _, _, _, _, _, _, _, _}) ->
    <<"jabber:memo:message">>;
do_get_ns({chat_info, _, _, _, _, _, _, _}) ->
    <<"jabber:memo:message">>;
do_get_ns({memo_info, _, _, _, _}) ->
    <<"jabber:memo:message">>;
do_get_ns({receipt_info, _, _, _, _, _, _}) ->
    <<"jabber:memo:message">>.

pp(chat_info, 7) ->
    [type, dispatched, content_type, target_id, target_name,
     max_user, now_user];
pp(auth_info, 10) ->
    [type, sub_type, info_id, info_name, auth_msg, otype,
     need_resend, operate_user, target_user, nick];
pp(receipt_info, 6) ->
    [type, msgid, topic_name, topic_id, max_user, now_user];
pp(memo_info, 4) ->
    [memo_type, chat_info, auth_info, receipt_info];
pp(_, _) -> no.

records() ->
    [{chat_info, 7}, {auth_info, 10}, {receipt_info, 6},
     {memo_info, 4}].

dec_enum(Val, Enums) ->
    AtomVal = erlang:binary_to_existing_atom(Val, utf8),
    case lists:member(AtomVal, Enums) of
      true -> AtomVal
    end.

enc_enum(Atom) -> erlang:atom_to_binary(Atom, utf8).

decode_memo_info(__TopXMLNS, __Opts,
		 {xmlel, <<"memo_info">>, _attrs, _els}) ->
    {Receipt_info, Auth_info, Chat_info} =
	decode_memo_info_els(__TopXMLNS, __Opts, _els,
			     undefined, undefined, undefined),
    Memo_type = decode_memo_info_attrs(__TopXMLNS, _attrs,
				       undefined),
    {memo_info, Memo_type, Chat_info, Auth_info,
     Receipt_info}.

decode_memo_info_els(__TopXMLNS, __Opts, [],
		     Receipt_info, Auth_info, Chat_info) ->
    {Receipt_info, Auth_info, Chat_info};
decode_memo_info_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"chat_info">>, _attrs, _} = _el | _els],
		     Receipt_info, Auth_info, Chat_info) ->
    case memo_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:memo:message">> ->
	  decode_memo_info_els(__TopXMLNS, __Opts, _els,
			       Receipt_info, Auth_info,
			       decode_chat_info(<<"jabber:memo:message">>,
						__Opts, _el));
      _ ->
	  decode_memo_info_els(__TopXMLNS, __Opts, _els,
			       Receipt_info, Auth_info, Chat_info)
    end;
decode_memo_info_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"auth_info">>, _attrs, _} = _el | _els],
		     Receipt_info, Auth_info, Chat_info) ->
    case memo_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:memo:message">> ->
	  decode_memo_info_els(__TopXMLNS, __Opts, _els,
			       Receipt_info,
			       decode_auth_info(<<"jabber:memo:message">>,
						__Opts, _el),
			       Chat_info);
      _ ->
	  decode_memo_info_els(__TopXMLNS, __Opts, _els,
			       Receipt_info, Auth_info, Chat_info)
    end;
decode_memo_info_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"receipt_info">>, _attrs, _} = _el | _els],
		     Receipt_info, Auth_info, Chat_info) ->
    case memo_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:memo:message">> ->
	  decode_memo_info_els(__TopXMLNS, __Opts, _els,
			       decode_receipt_info(<<"jabber:memo:message">>,
						   __Opts, _el),
			       Auth_info, Chat_info);
      _ ->
	  decode_memo_info_els(__TopXMLNS, __Opts, _els,
			       Receipt_info, Auth_info, Chat_info)
    end;
decode_memo_info_els(__TopXMLNS, __Opts, [_ | _els],
		     Receipt_info, Auth_info, Chat_info) ->
    decode_memo_info_els(__TopXMLNS, __Opts, _els,
			 Receipt_info, Auth_info, Chat_info).

decode_memo_info_attrs(__TopXMLNS,
		       [{<<"memo_type">>, _val} | _attrs], _Memo_type) ->
    decode_memo_info_attrs(__TopXMLNS, _attrs, _val);
decode_memo_info_attrs(__TopXMLNS, [_ | _attrs],
		       Memo_type) ->
    decode_memo_info_attrs(__TopXMLNS, _attrs, Memo_type);
decode_memo_info_attrs(__TopXMLNS, [], Memo_type) ->
    decode_memo_info_attr_memo_type(__TopXMLNS, Memo_type).

encode_memo_info({memo_info, Memo_type, Chat_info,
		  Auth_info, Receipt_info},
		 __TopXMLNS) ->
    __NewTopXMLNS =
	memo_codec:choose_top_xmlns(<<"jabber:memo:message">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_memo_info_$receipt_info'(Receipt_info,
						       __NewTopXMLNS,
						       'encode_memo_info_$auth_info'(Auth_info,
										     __NewTopXMLNS,
										     'encode_memo_info_$chat_info'(Chat_info,
														   __NewTopXMLNS,
														   [])))),
    _attrs = encode_memo_info_attr_memo_type(Memo_type,
					     memo_codec:enc_xmlns_attrs(__NewTopXMLNS,
									__TopXMLNS)),
    {xmlel, <<"memo_info">>, _attrs, _els}.

'encode_memo_info_$receipt_info'(undefined, __TopXMLNS,
				 _acc) ->
    _acc;
'encode_memo_info_$receipt_info'(Receipt_info,
				 __TopXMLNS, _acc) ->
    [encode_receipt_info(Receipt_info, __TopXMLNS) | _acc].

'encode_memo_info_$auth_info'(undefined, __TopXMLNS,
			      _acc) ->
    _acc;
'encode_memo_info_$auth_info'(Auth_info, __TopXMLNS,
			      _acc) ->
    [encode_auth_info(Auth_info, __TopXMLNS) | _acc].

'encode_memo_info_$chat_info'(undefined, __TopXMLNS,
			      _acc) ->
    _acc;
'encode_memo_info_$chat_info'(Chat_info, __TopXMLNS,
			      _acc) ->
    [encode_chat_info(Chat_info, __TopXMLNS) | _acc].

decode_memo_info_attr_memo_type(__TopXMLNS,
				undefined) ->
    erlang:error({memo_codec,
		  {missing_attr, <<"memo_type">>, <<"memo_info">>,
		   __TopXMLNS}});
decode_memo_info_attr_memo_type(__TopXMLNS, _val) ->
    case catch dec_enum(_val, [chat, auth, receipt]) of
      {'EXIT', _} ->
	  erlang:error({memo_codec,
			{bad_attr_value, <<"memo_type">>, <<"memo_info">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_memo_info_attr_memo_type(_val, _acc) ->
    [{<<"memo_type">>, enc_enum(_val)} | _acc].

decode_receipt_info(__TopXMLNS, __Opts,
		    {xmlel, <<"receipt_info">>, _attrs, _els}) ->
    {Type, Msgid, Topic_name, Topic_id, Max_user,
     Now_user} =
	decode_receipt_info_attrs(__TopXMLNS, _attrs, undefined,
				  undefined, undefined, undefined, undefined,
				  undefined),
    {receipt_info, Type, Msgid, Topic_name, Topic_id,
     Max_user, Now_user}.

decode_receipt_info_attrs(__TopXMLNS,
			  [{<<"type">>, _val} | _attrs], _Type, Msgid,
			  Topic_name, Topic_id, Max_user, Now_user) ->
    decode_receipt_info_attrs(__TopXMLNS, _attrs, _val,
			      Msgid, Topic_name, Topic_id, Max_user, Now_user);
decode_receipt_info_attrs(__TopXMLNS,
			  [{<<"msgid">>, _val} | _attrs], Type, _Msgid,
			  Topic_name, Topic_id, Max_user, Now_user) ->
    decode_receipt_info_attrs(__TopXMLNS, _attrs, Type,
			      _val, Topic_name, Topic_id, Max_user, Now_user);
decode_receipt_info_attrs(__TopXMLNS,
			  [{<<"topic_name">>, _val} | _attrs], Type, Msgid,
			  _Topic_name, Topic_id, Max_user, Now_user) ->
    decode_receipt_info_attrs(__TopXMLNS, _attrs, Type,
			      Msgid, _val, Topic_id, Max_user, Now_user);
decode_receipt_info_attrs(__TopXMLNS,
			  [{<<"topic_id">>, _val} | _attrs], Type, Msgid,
			  Topic_name, _Topic_id, Max_user, Now_user) ->
    decode_receipt_info_attrs(__TopXMLNS, _attrs, Type,
			      Msgid, Topic_name, _val, Max_user, Now_user);
decode_receipt_info_attrs(__TopXMLNS,
			  [{<<"max_user">>, _val} | _attrs], Type, Msgid,
			  Topic_name, Topic_id, _Max_user, Now_user) ->
    decode_receipt_info_attrs(__TopXMLNS, _attrs, Type,
			      Msgid, Topic_name, Topic_id, _val, Now_user);
decode_receipt_info_attrs(__TopXMLNS,
			  [{<<"now_user">>, _val} | _attrs], Type, Msgid,
			  Topic_name, Topic_id, Max_user, _Now_user) ->
    decode_receipt_info_attrs(__TopXMLNS, _attrs, Type,
			      Msgid, Topic_name, Topic_id, Max_user, _val);
decode_receipt_info_attrs(__TopXMLNS, [_ | _attrs],
			  Type, Msgid, Topic_name, Topic_id, Max_user,
			  Now_user) ->
    decode_receipt_info_attrs(__TopXMLNS, _attrs, Type,
			      Msgid, Topic_name, Topic_id, Max_user, Now_user);
decode_receipt_info_attrs(__TopXMLNS, [], Type, Msgid,
			  Topic_name, Topic_id, Max_user, Now_user) ->
    {decode_receipt_info_attr_type(__TopXMLNS, Type),
     decode_receipt_info_attr_msgid(__TopXMLNS, Msgid),
     decode_receipt_info_attr_topic_name(__TopXMLNS,
					 Topic_name),
     decode_receipt_info_attr_topic_id(__TopXMLNS, Topic_id),
     decode_receipt_info_attr_max_user(__TopXMLNS, Max_user),
     decode_receipt_info_attr_now_user(__TopXMLNS,
				       Now_user)}.

encode_receipt_info({receipt_info, Type, Msgid,
		     Topic_name, Topic_id, Max_user, Now_user},
		    __TopXMLNS) ->
    __NewTopXMLNS =
	memo_codec:choose_top_xmlns(<<"jabber:memo:message">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_receipt_info_attr_now_user(Now_user,
					       encode_receipt_info_attr_max_user(Max_user,
										 encode_receipt_info_attr_topic_id(Topic_id,
														   encode_receipt_info_attr_topic_name(Topic_name,
																		       encode_receipt_info_attr_msgid(Msgid,
																						      encode_receipt_info_attr_type(Type,
																										    memo_codec:enc_xmlns_attrs(__NewTopXMLNS,
																													       __TopXMLNS))))))),
    {xmlel, <<"receipt_info">>, _attrs, _els}.

decode_receipt_info_attr_type(__TopXMLNS, undefined) ->
    erlang:error({memo_codec,
		  {missing_attr, <<"type">>, <<"receipt_info">>,
		   __TopXMLNS}});
decode_receipt_info_attr_type(__TopXMLNS, _val) ->
    case catch dec_enum(_val, [server, received, read]) of
      {'EXIT', _} ->
	  erlang:error({memo_codec,
			{bad_attr_value, <<"type">>, <<"receipt_info">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_receipt_info_attr_type(_val, _acc) ->
    [{<<"type">>, enc_enum(_val)} | _acc].

decode_receipt_info_attr_msgid(__TopXMLNS, undefined) ->
    <<>>;
decode_receipt_info_attr_msgid(__TopXMLNS, _val) ->
    _val.

encode_receipt_info_attr_msgid(<<>>, _acc) -> _acc;
encode_receipt_info_attr_msgid(_val, _acc) ->
    [{<<"msgid">>, _val} | _acc].

decode_receipt_info_attr_topic_name(__TopXMLNS,
				    undefined) ->
    <<>>;
decode_receipt_info_attr_topic_name(__TopXMLNS, _val) ->
    _val.

encode_receipt_info_attr_topic_name(<<>>, _acc) -> _acc;
encode_receipt_info_attr_topic_name(_val, _acc) ->
    [{<<"topic_name">>, _val} | _acc].

decode_receipt_info_attr_topic_id(__TopXMLNS,
				  undefined) ->
    <<>>;
decode_receipt_info_attr_topic_id(__TopXMLNS, _val) ->
    _val.

encode_receipt_info_attr_topic_id(<<>>, _acc) -> _acc;
encode_receipt_info_attr_topic_id(_val, _acc) ->
    [{<<"topic_id">>, _val} | _acc].

decode_receipt_info_attr_max_user(__TopXMLNS,
				  undefined) ->
    <<>>;
decode_receipt_info_attr_max_user(__TopXMLNS, _val) ->
    _val.

encode_receipt_info_attr_max_user(<<>>, _acc) -> _acc;
encode_receipt_info_attr_max_user(_val, _acc) ->
    [{<<"max_user">>, _val} | _acc].

decode_receipt_info_attr_now_user(__TopXMLNS,
				  undefined) ->
    <<>>;
decode_receipt_info_attr_now_user(__TopXMLNS, _val) ->
    _val.

encode_receipt_info_attr_now_user(<<>>, _acc) -> _acc;
encode_receipt_info_attr_now_user(_val, _acc) ->
    [{<<"now_user">>, _val} | _acc].

decode_auth_info(__TopXMLNS, __Opts,
		 {xmlel, <<"auth_info">>, _attrs, _els}) ->
    {Type, Sub_type, Info_id, Info_name, Auth_msg, Otype,
     Need_resend, Operate_user, Target_user, Nick} =
	decode_auth_info_attrs(__TopXMLNS, _attrs, undefined,
			       undefined, undefined, undefined, undefined,
			       undefined, undefined, undefined, undefined,
			       undefined),
    {auth_info, Type, Sub_type, Info_id, Info_name,
     Auth_msg, Otype, Need_resend, Operate_user, Target_user,
     Nick}.

decode_auth_info_attrs(__TopXMLNS,
		       [{<<"type">>, _val} | _attrs], _Type, Sub_type, Info_id,
		       Info_name, Auth_msg, Otype, Need_resend, Operate_user,
		       Target_user, Nick) ->
    decode_auth_info_attrs(__TopXMLNS, _attrs, _val,
			   Sub_type, Info_id, Info_name, Auth_msg, Otype,
			   Need_resend, Operate_user, Target_user, Nick);
decode_auth_info_attrs(__TopXMLNS,
		       [{<<"sub_type">>, _val} | _attrs], Type, _Sub_type,
		       Info_id, Info_name, Auth_msg, Otype, Need_resend,
		       Operate_user, Target_user, Nick) ->
    decode_auth_info_attrs(__TopXMLNS, _attrs, Type, _val,
			   Info_id, Info_name, Auth_msg, Otype, Need_resend,
			   Operate_user, Target_user, Nick);
decode_auth_info_attrs(__TopXMLNS,
		       [{<<"info_id">>, _val} | _attrs], Type, Sub_type,
		       _Info_id, Info_name, Auth_msg, Otype, Need_resend,
		       Operate_user, Target_user, Nick) ->
    decode_auth_info_attrs(__TopXMLNS, _attrs, Type,
			   Sub_type, _val, Info_name, Auth_msg, Otype,
			   Need_resend, Operate_user, Target_user, Nick);
decode_auth_info_attrs(__TopXMLNS,
		       [{<<"info_name">>, _val} | _attrs], Type, Sub_type,
		       Info_id, _Info_name, Auth_msg, Otype, Need_resend,
		       Operate_user, Target_user, Nick) ->
    decode_auth_info_attrs(__TopXMLNS, _attrs, Type,
			   Sub_type, Info_id, _val, Auth_msg, Otype,
			   Need_resend, Operate_user, Target_user, Nick);
decode_auth_info_attrs(__TopXMLNS,
		       [{<<"auth_msg">>, _val} | _attrs], Type, Sub_type,
		       Info_id, Info_name, _Auth_msg, Otype, Need_resend,
		       Operate_user, Target_user, Nick) ->
    decode_auth_info_attrs(__TopXMLNS, _attrs, Type,
			   Sub_type, Info_id, Info_name, _val, Otype,
			   Need_resend, Operate_user, Target_user, Nick);
decode_auth_info_attrs(__TopXMLNS,
		       [{<<"otype">>, _val} | _attrs], Type, Sub_type, Info_id,
		       Info_name, Auth_msg, _Otype, Need_resend, Operate_user,
		       Target_user, Nick) ->
    decode_auth_info_attrs(__TopXMLNS, _attrs, Type,
			   Sub_type, Info_id, Info_name, Auth_msg, _val,
			   Need_resend, Operate_user, Target_user, Nick);
decode_auth_info_attrs(__TopXMLNS,
		       [{<<"need_resend">>, _val} | _attrs], Type, Sub_type,
		       Info_id, Info_name, Auth_msg, Otype, _Need_resend,
		       Operate_user, Target_user, Nick) ->
    decode_auth_info_attrs(__TopXMLNS, _attrs, Type,
			   Sub_type, Info_id, Info_name, Auth_msg, Otype, _val,
			   Operate_user, Target_user, Nick);
decode_auth_info_attrs(__TopXMLNS,
		       [{<<"operate_user">>, _val} | _attrs], Type, Sub_type,
		       Info_id, Info_name, Auth_msg, Otype, Need_resend,
		       _Operate_user, Target_user, Nick) ->
    decode_auth_info_attrs(__TopXMLNS, _attrs, Type,
			   Sub_type, Info_id, Info_name, Auth_msg, Otype,
			   Need_resend, _val, Target_user, Nick);
decode_auth_info_attrs(__TopXMLNS,
		       [{<<"target_user">>, _val} | _attrs], Type, Sub_type,
		       Info_id, Info_name, Auth_msg, Otype, Need_resend,
		       Operate_user, _Target_user, Nick) ->
    decode_auth_info_attrs(__TopXMLNS, _attrs, Type,
			   Sub_type, Info_id, Info_name, Auth_msg, Otype,
			   Need_resend, Operate_user, _val, Nick);
decode_auth_info_attrs(__TopXMLNS,
		       [{<<"nick">>, _val} | _attrs], Type, Sub_type, Info_id,
		       Info_name, Auth_msg, Otype, Need_resend, Operate_user,
		       Target_user, _Nick) ->
    decode_auth_info_attrs(__TopXMLNS, _attrs, Type,
			   Sub_type, Info_id, Info_name, Auth_msg, Otype,
			   Need_resend, Operate_user, Target_user, _val);
decode_auth_info_attrs(__TopXMLNS, [_ | _attrs], Type,
		       Sub_type, Info_id, Info_name, Auth_msg, Otype,
		       Need_resend, Operate_user, Target_user, Nick) ->
    decode_auth_info_attrs(__TopXMLNS, _attrs, Type,
			   Sub_type, Info_id, Info_name, Auth_msg, Otype,
			   Need_resend, Operate_user, Target_user, Nick);
decode_auth_info_attrs(__TopXMLNS, [], Type, Sub_type,
		       Info_id, Info_name, Auth_msg, Otype, Need_resend,
		       Operate_user, Target_user, Nick) ->
    {decode_auth_info_attr_type(__TopXMLNS, Type),
     decode_auth_info_attr_sub_type(__TopXMLNS, Sub_type),
     decode_auth_info_attr_info_id(__TopXMLNS, Info_id),
     decode_auth_info_attr_info_name(__TopXMLNS, Info_name),
     decode_auth_info_attr_auth_msg(__TopXMLNS, Auth_msg),
     decode_auth_info_attr_otype(__TopXMLNS, Otype),
     decode_auth_info_attr_need_resend(__TopXMLNS,
				       Need_resend),
     decode_auth_info_attr_operate_user(__TopXMLNS,
					Operate_user),
     decode_auth_info_attr_target_user(__TopXMLNS,
				       Target_user),
     decode_auth_info_attr_nick(__TopXMLNS, Nick)}.

encode_auth_info({auth_info, Type, Sub_type, Info_id,
		  Info_name, Auth_msg, Otype, Need_resend, Operate_user,
		  Target_user, Nick},
		 __TopXMLNS) ->
    __NewTopXMLNS =
	memo_codec:choose_top_xmlns(<<"jabber:memo:message">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_auth_info_attr_nick(Nick,
					encode_auth_info_attr_target_user(Target_user,
									  encode_auth_info_attr_operate_user(Operate_user,
													     encode_auth_info_attr_need_resend(Need_resend,
																	       encode_auth_info_attr_otype(Otype,
																					   encode_auth_info_attr_auth_msg(Auth_msg,
																									  encode_auth_info_attr_info_name(Info_name,
																													  encode_auth_info_attr_info_id(Info_id,
																																	encode_auth_info_attr_sub_type(Sub_type,
																																				       encode_auth_info_attr_type(Type,
																																								  memo_codec:enc_xmlns_attrs(__NewTopXMLNS,
																																											     __TopXMLNS))))))))))),
    {xmlel, <<"auth_info">>, _attrs, _els}.

decode_auth_info_attr_type(__TopXMLNS, undefined) ->
    erlang:error({memo_codec,
		  {missing_attr, <<"type">>, <<"auth_info">>,
		   __TopXMLNS}});
decode_auth_info_attr_type(__TopXMLNS, _val) ->
    case catch dec_enum(_val,
			[groupauth, sgroupauth, topicauth])
	of
      {'EXIT', _} ->
	  erlang:error({memo_codec,
			{bad_attr_value, <<"type">>, <<"auth_info">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_auth_info_attr_type(_val, _acc) ->
    [{<<"type">>, enc_enum(_val)} | _acc].

decode_auth_info_attr_sub_type(__TopXMLNS, undefined) ->
    <<>>;
decode_auth_info_attr_sub_type(__TopXMLNS, _val) ->
    _val.

encode_auth_info_attr_sub_type(<<>>, _acc) -> _acc;
encode_auth_info_attr_sub_type(_val, _acc) ->
    [{<<"sub_type">>, _val} | _acc].

decode_auth_info_attr_info_id(__TopXMLNS, undefined) ->
    <<>>;
decode_auth_info_attr_info_id(__TopXMLNS, _val) -> _val.

encode_auth_info_attr_info_id(<<>>, _acc) -> _acc;
encode_auth_info_attr_info_id(_val, _acc) ->
    [{<<"info_id">>, _val} | _acc].

decode_auth_info_attr_info_name(__TopXMLNS,
				undefined) ->
    <<>>;
decode_auth_info_attr_info_name(__TopXMLNS, _val) ->
    _val.

encode_auth_info_attr_info_name(<<>>, _acc) -> _acc;
encode_auth_info_attr_info_name(_val, _acc) ->
    [{<<"info_name">>, _val} | _acc].

decode_auth_info_attr_auth_msg(__TopXMLNS, undefined) ->
    <<>>;
decode_auth_info_attr_auth_msg(__TopXMLNS, _val) ->
    _val.

encode_auth_info_attr_auth_msg(<<>>, _acc) -> _acc;
encode_auth_info_attr_auth_msg(_val, _acc) ->
    [{<<"auth_msg">>, _val} | _acc].

decode_auth_info_attr_otype(__TopXMLNS, undefined) ->
    <<>>;
decode_auth_info_attr_otype(__TopXMLNS, _val) -> _val.

encode_auth_info_attr_otype(<<>>, _acc) -> _acc;
encode_auth_info_attr_otype(_val, _acc) ->
    [{<<"otype">>, _val} | _acc].

decode_auth_info_attr_need_resend(__TopXMLNS,
				  undefined) ->
    <<>>;
decode_auth_info_attr_need_resend(__TopXMLNS, _val) ->
    _val.

encode_auth_info_attr_need_resend(<<>>, _acc) -> _acc;
encode_auth_info_attr_need_resend(_val, _acc) ->
    [{<<"need_resend">>, _val} | _acc].

decode_auth_info_attr_operate_user(__TopXMLNS,
				   undefined) ->
    <<>>;
decode_auth_info_attr_operate_user(__TopXMLNS, _val) ->
    _val.

encode_auth_info_attr_operate_user(<<>>, _acc) -> _acc;
encode_auth_info_attr_operate_user(_val, _acc) ->
    [{<<"operate_user">>, _val} | _acc].

decode_auth_info_attr_target_user(__TopXMLNS,
				  undefined) ->
    <<>>;
decode_auth_info_attr_target_user(__TopXMLNS, _val) ->
    _val.

encode_auth_info_attr_target_user(<<>>, _acc) -> _acc;
encode_auth_info_attr_target_user(_val, _acc) ->
    [{<<"target_user">>, _val} | _acc].

decode_auth_info_attr_nick(__TopXMLNS, undefined) ->
    erlang:error({memo_codec,
		  {missing_attr, <<"nick">>, <<"auth_info">>,
		   __TopXMLNS}});
decode_auth_info_attr_nick(__TopXMLNS, _val) -> _val.

encode_auth_info_attr_nick(_val, _acc) ->
    [{<<"nick">>, _val} | _acc].

decode_chat_info(__TopXMLNS, __Opts,
		 {xmlel, <<"chat_info">>, _attrs, _els}) ->
    {Type, Dispatched, Target_id, Content_type, Target_name,
     Max_user, Now_user} =
	decode_chat_info_attrs(__TopXMLNS, _attrs, undefined,
			       undefined, undefined, undefined, undefined,
			       undefined, undefined),
    {chat_info, Type, Dispatched, Content_type, Target_id,
     Target_name, Max_user, Now_user}.

decode_chat_info_attrs(__TopXMLNS,
		       [{<<"type">>, _val} | _attrs], _Type, Dispatched,
		       Target_id, Content_type, Target_name, Max_user,
		       Now_user) ->
    decode_chat_info_attrs(__TopXMLNS, _attrs, _val,
			   Dispatched, Target_id, Content_type, Target_name,
			   Max_user, Now_user);
decode_chat_info_attrs(__TopXMLNS,
		       [{<<"dispatched">>, _val} | _attrs], Type, _Dispatched,
		       Target_id, Content_type, Target_name, Max_user,
		       Now_user) ->
    decode_chat_info_attrs(__TopXMLNS, _attrs, Type, _val,
			   Target_id, Content_type, Target_name, Max_user,
			   Now_user);
decode_chat_info_attrs(__TopXMLNS,
		       [{<<"target_id">>, _val} | _attrs], Type, Dispatched,
		       _Target_id, Content_type, Target_name, Max_user,
		       Now_user) ->
    decode_chat_info_attrs(__TopXMLNS, _attrs, Type,
			   Dispatched, _val, Content_type, Target_name,
			   Max_user, Now_user);
decode_chat_info_attrs(__TopXMLNS,
		       [{<<"content_type">>, _val} | _attrs], Type, Dispatched,
		       Target_id, _Content_type, Target_name, Max_user,
		       Now_user) ->
    decode_chat_info_attrs(__TopXMLNS, _attrs, Type,
			   Dispatched, Target_id, _val, Target_name, Max_user,
			   Now_user);
decode_chat_info_attrs(__TopXMLNS,
		       [{<<"target_name">>, _val} | _attrs], Type, Dispatched,
		       Target_id, Content_type, _Target_name, Max_user,
		       Now_user) ->
    decode_chat_info_attrs(__TopXMLNS, _attrs, Type,
			   Dispatched, Target_id, Content_type, _val, Max_user,
			   Now_user);
decode_chat_info_attrs(__TopXMLNS,
		       [{<<"max_user">>, _val} | _attrs], Type, Dispatched,
		       Target_id, Content_type, Target_name, _Max_user,
		       Now_user) ->
    decode_chat_info_attrs(__TopXMLNS, _attrs, Type,
			   Dispatched, Target_id, Content_type, Target_name,
			   _val, Now_user);
decode_chat_info_attrs(__TopXMLNS,
		       [{<<"now_user">>, _val} | _attrs], Type, Dispatched,
		       Target_id, Content_type, Target_name, Max_user,
		       _Now_user) ->
    decode_chat_info_attrs(__TopXMLNS, _attrs, Type,
			   Dispatched, Target_id, Content_type, Target_name,
			   Max_user, _val);
decode_chat_info_attrs(__TopXMLNS, [_ | _attrs], Type,
		       Dispatched, Target_id, Content_type, Target_name,
		       Max_user, Now_user) ->
    decode_chat_info_attrs(__TopXMLNS, _attrs, Type,
			   Dispatched, Target_id, Content_type, Target_name,
			   Max_user, Now_user);
decode_chat_info_attrs(__TopXMLNS, [], Type, Dispatched,
		       Target_id, Content_type, Target_name, Max_user,
		       Now_user) ->
    {decode_chat_info_attr_type(__TopXMLNS, Type),
     decode_chat_info_attr_dispatched(__TopXMLNS,
				      Dispatched),
     decode_chat_info_attr_target_id(__TopXMLNS, Target_id),
     decode_chat_info_attr_content_type(__TopXMLNS,
					Content_type),
     decode_chat_info_attr_target_name(__TopXMLNS,
				       Target_name),
     decode_chat_info_attr_max_user(__TopXMLNS, Max_user),
     decode_chat_info_attr_now_user(__TopXMLNS, Now_user)}.

encode_chat_info({chat_info, Type, Dispatched,
		  Content_type, Target_id, Target_name, Max_user,
		  Now_user},
		 __TopXMLNS) ->
    __NewTopXMLNS =
	memo_codec:choose_top_xmlns(<<"jabber:memo:message">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_chat_info_attr_now_user(Now_user,
					    encode_chat_info_attr_max_user(Max_user,
									   encode_chat_info_attr_target_name(Target_name,
													     encode_chat_info_attr_content_type(Content_type,
																		encode_chat_info_attr_target_id(Target_id,
																						encode_chat_info_attr_dispatched(Dispatched,
																										 encode_chat_info_attr_type(Type,
																													    memo_codec:enc_xmlns_attrs(__NewTopXMLNS,
																																       __TopXMLNS)))))))),
    {xmlel, <<"chat_info">>, _attrs, _els}.

decode_chat_info_attr_type(__TopXMLNS, undefined) ->
    erlang:error({memo_codec,
		  {missing_attr, <<"type">>, <<"chat_info">>,
		   __TopXMLNS}});
decode_chat_info_attr_type(__TopXMLNS, _val) ->
    case catch dec_enum(_val, [oto, topic, group]) of
      {'EXIT', _} ->
	  erlang:error({memo_codec,
			{bad_attr_value, <<"type">>, <<"chat_info">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_chat_info_attr_type(_val, _acc) ->
    [{<<"type">>, enc_enum(_val)} | _acc].

decode_chat_info_attr_dispatched(__TopXMLNS,
				 undefined) ->
    <<>>;
decode_chat_info_attr_dispatched(__TopXMLNS, _val) ->
    _val.

encode_chat_info_attr_dispatched(<<>>, _acc) -> _acc;
encode_chat_info_attr_dispatched(_val, _acc) ->
    [{<<"dispatched">>, _val} | _acc].

decode_chat_info_attr_target_id(__TopXMLNS,
				undefined) ->
    <<>>;
decode_chat_info_attr_target_id(__TopXMLNS, _val) ->
    _val.

encode_chat_info_attr_target_id(<<>>, _acc) -> _acc;
encode_chat_info_attr_target_id(_val, _acc) ->
    [{<<"target_id">>, _val} | _acc].

decode_chat_info_attr_content_type(__TopXMLNS,
				   undefined) ->
    <<>>;
decode_chat_info_attr_content_type(__TopXMLNS, _val) ->
    _val.

encode_chat_info_attr_content_type(<<>>, _acc) -> _acc;
encode_chat_info_attr_content_type(_val, _acc) ->
    [{<<"content_type">>, _val} | _acc].

decode_chat_info_attr_target_name(__TopXMLNS,
				  undefined) ->
    <<>>;
decode_chat_info_attr_target_name(__TopXMLNS, _val) ->
    _val.

encode_chat_info_attr_target_name(<<>>, _acc) -> _acc;
encode_chat_info_attr_target_name(_val, _acc) ->
    [{<<"target_name">>, _val} | _acc].

decode_chat_info_attr_max_user(__TopXMLNS, undefined) ->
    <<>>;
decode_chat_info_attr_max_user(__TopXMLNS, _val) ->
    _val.

encode_chat_info_attr_max_user(<<>>, _acc) -> _acc;
encode_chat_info_attr_max_user(_val, _acc) ->
    [{<<"max_user">>, _val} | _acc].

decode_chat_info_attr_now_user(__TopXMLNS, undefined) ->
    <<>>;
decode_chat_info_attr_now_user(__TopXMLNS, _val) ->
    _val.

encode_chat_info_attr_now_user(<<>>, _acc) -> _acc;
encode_chat_info_attr_now_user(_val, _acc) ->
    [{<<"now_user">>, _val} | _acc].
