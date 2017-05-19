%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(memo_xep_topic).

-compile(export_all).

do_decode(<<"query">>, <<"jabber:iq:topic">>, El,
	  Opts) ->
    decode_mod_topic(<<"jabber:iq:topic">>, Opts, El);
do_decode(<<"query_topic_info">>, <<"jabber:iq:topic">>,
	  El, Opts) ->
    decode_query_topic_info(<<"jabber:iq:topic">>, Opts,
			    El);
do_decode(<<"topic_user_item">>, <<"jabber:iq:topic">>,
	  El, Opts) ->
    decode_topic_user_item(<<"jabber:iq:topic">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"query">>, <<"jabber:iq:topic">>},
     {<<"query_topic_info">>, <<"jabber:iq:topic">>},
     {<<"topic_user_item">>, <<"jabber:iq:topic">>}].

do_encode({topic_user_item, _, _, _, _} =
	      Topic_user_item,
	  TopXMLNS) ->
    encode_topic_user_item(Topic_user_item, TopXMLNS);
do_encode({query_topic_info, _, _, _, _, _, _, _} =
	      Query_topic_info,
	  TopXMLNS) ->
    encode_query_topic_info(Query_topic_info, TopXMLNS);
do_encode({mod_topic, _, _, _, _} = Query, TopXMLNS) ->
    encode_mod_topic(Query, TopXMLNS).

do_get_name({mod_topic, _, _, _, _}) -> <<"query">>;
do_get_name({query_topic_info, _, _, _, _, _, _, _}) ->
    <<"query_topic_info">>;
do_get_name({topic_user_item, _, _, _, _}) ->
    <<"topic_user_item">>.

do_get_ns({mod_topic, _, _, _, _}) ->
    <<"jabber:iq:topic">>;
do_get_ns({query_topic_info, _, _, _, _, _, _, _}) ->
    <<"jabber:iq:topic">>;
do_get_ns({topic_user_item, _, _, _, _}) ->
    <<"jabber:iq:topic">>.

pp(topic_user_item, 4) -> [user, server, nick, addtime];
pp(query_topic_info, 7) ->
    [tid, tname, tcreater, tcreate_time, topic_type,
     user_item, tmaxnum];
pp(mod_topic, 4) -> [rtype, code, tuser, topic_info];
pp(_, _) -> no.

records() ->
    [{topic_user_item, 4}, {query_topic_info, 7},
     {mod_topic, 4}].

decode_mod_topic(__TopXMLNS, __Opts,
		 {xmlel, <<"query">>, _attrs, _els}) ->
    Topic_info = decode_mod_topic_els(__TopXMLNS, __Opts,
				      _els, undefined),
    {Rtype, Code, Tuser} =
	decode_mod_topic_attrs(__TopXMLNS, _attrs, undefined,
			       undefined, undefined),
    {mod_topic, Rtype, Code, Tuser, Topic_info}.

decode_mod_topic_els(__TopXMLNS, __Opts, [],
		     Topic_info) ->
    Topic_info;
decode_mod_topic_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"query_topic_info">>, _attrs, _} = _el
		      | _els],
		     Topic_info) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:topic">> ->
	  decode_mod_topic_els(__TopXMLNS, __Opts, _els,
			       decode_query_topic_info(<<"jabber:iq:topic">>,
						       __Opts, _el));
      _ ->
	  decode_mod_topic_els(__TopXMLNS, __Opts, _els,
			       Topic_info)
    end;
decode_mod_topic_els(__TopXMLNS, __Opts, [_ | _els],
		     Topic_info) ->
    decode_mod_topic_els(__TopXMLNS, __Opts, _els,
			 Topic_info).

decode_mod_topic_attrs(__TopXMLNS,
		       [{<<"rtype">>, _val} | _attrs], _Rtype, Code, Tuser) ->
    decode_mod_topic_attrs(__TopXMLNS, _attrs, _val, Code,
			   Tuser);
decode_mod_topic_attrs(__TopXMLNS,
		       [{<<"code">>, _val} | _attrs], Rtype, _Code, Tuser) ->
    decode_mod_topic_attrs(__TopXMLNS, _attrs, Rtype, _val,
			   Tuser);
decode_mod_topic_attrs(__TopXMLNS,
		       [{<<"tuser">>, _val} | _attrs], Rtype, Code, _Tuser) ->
    decode_mod_topic_attrs(__TopXMLNS, _attrs, Rtype, Code,
			   _val);
decode_mod_topic_attrs(__TopXMLNS, [_ | _attrs], Rtype,
		       Code, Tuser) ->
    decode_mod_topic_attrs(__TopXMLNS, _attrs, Rtype, Code,
			   Tuser);
decode_mod_topic_attrs(__TopXMLNS, [], Rtype, Code,
		       Tuser) ->
    {decode_mod_topic_attr_rtype(__TopXMLNS, Rtype),
     decode_mod_topic_attr_code(__TopXMLNS, Code),
     decode_mod_topic_attr_tuser(__TopXMLNS, Tuser)}.

encode_mod_topic({mod_topic, Rtype, Code, Tuser,
		  Topic_info},
		 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:topic">>, [],
				    __TopXMLNS),
    _els =
	lists:reverse('encode_mod_topic_$topic_info'(Topic_info,
						     __NewTopXMLNS, [])),
    _attrs = encode_mod_topic_attr_tuser(Tuser,
					 encode_mod_topic_attr_code(Code,
								    encode_mod_topic_attr_rtype(Rtype,
												xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
															   __TopXMLNS)))),
    {xmlel, <<"query">>, _attrs, _els}.

'encode_mod_topic_$topic_info'(undefined, __TopXMLNS,
			       _acc) ->
    _acc;
'encode_mod_topic_$topic_info'(Topic_info, __TopXMLNS,
			       _acc) ->
    [encode_query_topic_info(Topic_info, __TopXMLNS)
     | _acc].

decode_mod_topic_attr_rtype(__TopXMLNS, undefined) ->
    <<>>;
decode_mod_topic_attr_rtype(__TopXMLNS, _val) -> _val.

encode_mod_topic_attr_rtype(<<>>, _acc) -> _acc;
encode_mod_topic_attr_rtype(_val, _acc) ->
    [{<<"rtype">>, _val} | _acc].

decode_mod_topic_attr_code(__TopXMLNS, undefined) ->
    <<>>;
decode_mod_topic_attr_code(__TopXMLNS, _val) -> _val.

encode_mod_topic_attr_code(<<>>, _acc) -> _acc;
encode_mod_topic_attr_code(_val, _acc) ->
    [{<<"code">>, _val} | _acc].

decode_mod_topic_attr_tuser(__TopXMLNS, undefined) ->
    <<>>;
decode_mod_topic_attr_tuser(__TopXMLNS, _val) -> _val.

encode_mod_topic_attr_tuser(<<>>, _acc) -> _acc;
encode_mod_topic_attr_tuser(_val, _acc) ->
    [{<<"tuser">>, _val} | _acc].

decode_query_topic_info(__TopXMLNS, __Opts,
			{xmlel, <<"query_topic_info">>, _attrs, _els}) ->
    User_item = decode_query_topic_info_els(__TopXMLNS,
					    __Opts, _els, []),
    {Tid, Tname, Tcreater, Tcreate_time, Topic_type,
     Tmaxnum} =
	decode_query_topic_info_attrs(__TopXMLNS, _attrs,
				      undefined, undefined, undefined,
				      undefined, undefined, undefined),
    {query_topic_info, Tid, Tname, Tcreater, Tcreate_time,
     Topic_type, User_item, Tmaxnum}.

decode_query_topic_info_els(__TopXMLNS, __Opts, [],
			    User_item) ->
    lists:reverse(User_item);
decode_query_topic_info_els(__TopXMLNS, __Opts,
			    [{xmlel, <<"topic_user_item">>, _attrs, _} = _el
			     | _els],
			    User_item) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:iq:topic">> ->
	  decode_query_topic_info_els(__TopXMLNS, __Opts, _els,
				      [decode_topic_user_item(<<"jabber:iq:topic">>,
							      __Opts, _el)
				       | User_item]);
      _ ->
	  decode_query_topic_info_els(__TopXMLNS, __Opts, _els,
				      User_item)
    end;
decode_query_topic_info_els(__TopXMLNS, __Opts,
			    [_ | _els], User_item) ->
    decode_query_topic_info_els(__TopXMLNS, __Opts, _els,
				User_item).

decode_query_topic_info_attrs(__TopXMLNS,
			      [{<<"tid">>, _val} | _attrs], _Tid, Tname,
			      Tcreater, Tcreate_time, Topic_type, Tmaxnum) ->
    decode_query_topic_info_attrs(__TopXMLNS, _attrs, _val,
				  Tname, Tcreater, Tcreate_time, Topic_type,
				  Tmaxnum);
decode_query_topic_info_attrs(__TopXMLNS,
			      [{<<"tname">>, _val} | _attrs], Tid, _Tname,
			      Tcreater, Tcreate_time, Topic_type, Tmaxnum) ->
    decode_query_topic_info_attrs(__TopXMLNS, _attrs, Tid,
				  _val, Tcreater, Tcreate_time, Topic_type,
				  Tmaxnum);
decode_query_topic_info_attrs(__TopXMLNS,
			      [{<<"tcreater">>, _val} | _attrs], Tid, Tname,
			      _Tcreater, Tcreate_time, Topic_type, Tmaxnum) ->
    decode_query_topic_info_attrs(__TopXMLNS, _attrs, Tid,
				  Tname, _val, Tcreate_time, Topic_type,
				  Tmaxnum);
decode_query_topic_info_attrs(__TopXMLNS,
			      [{<<"tcreate_time">>, _val} | _attrs], Tid, Tname,
			      Tcreater, _Tcreate_time, Topic_type, Tmaxnum) ->
    decode_query_topic_info_attrs(__TopXMLNS, _attrs, Tid,
				  Tname, Tcreater, _val, Topic_type, Tmaxnum);
decode_query_topic_info_attrs(__TopXMLNS,
			      [{<<"topic_type">>, _val} | _attrs], Tid, Tname,
			      Tcreater, Tcreate_time, _Topic_type, Tmaxnum) ->
    decode_query_topic_info_attrs(__TopXMLNS, _attrs, Tid,
				  Tname, Tcreater, Tcreate_time, _val, Tmaxnum);
decode_query_topic_info_attrs(__TopXMLNS,
			      [{<<"tmaxnum">>, _val} | _attrs], Tid, Tname,
			      Tcreater, Tcreate_time, Topic_type, _Tmaxnum) ->
    decode_query_topic_info_attrs(__TopXMLNS, _attrs, Tid,
				  Tname, Tcreater, Tcreate_time, Topic_type,
				  _val);
decode_query_topic_info_attrs(__TopXMLNS, [_ | _attrs],
			      Tid, Tname, Tcreater, Tcreate_time, Topic_type,
			      Tmaxnum) ->
    decode_query_topic_info_attrs(__TopXMLNS, _attrs, Tid,
				  Tname, Tcreater, Tcreate_time, Topic_type,
				  Tmaxnum);
decode_query_topic_info_attrs(__TopXMLNS, [], Tid,
			      Tname, Tcreater, Tcreate_time, Topic_type,
			      Tmaxnum) ->
    {decode_query_topic_info_attr_tid(__TopXMLNS, Tid),
     decode_query_topic_info_attr_tname(__TopXMLNS, Tname),
     decode_query_topic_info_attr_tcreater(__TopXMLNS,
					   Tcreater),
     decode_query_topic_info_attr_tcreate_time(__TopXMLNS,
					       Tcreate_time),
     decode_query_topic_info_attr_topic_type(__TopXMLNS,
					     Topic_type),
     decode_query_topic_info_attr_tmaxnum(__TopXMLNS,
					  Tmaxnum)}.

encode_query_topic_info({query_topic_info, Tid, Tname,
			 Tcreater, Tcreate_time, Topic_type, User_item,
			 Tmaxnum},
			__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:topic">>, [],
				    __TopXMLNS),
    _els =
	lists:reverse('encode_query_topic_info_$user_item'(User_item,
							   __NewTopXMLNS, [])),
    _attrs = encode_query_topic_info_attr_tmaxnum(Tmaxnum,
						  encode_query_topic_info_attr_topic_type(Topic_type,
											  encode_query_topic_info_attr_tcreate_time(Tcreate_time,
																    encode_query_topic_info_attr_tcreater(Tcreater,
																					  encode_query_topic_info_attr_tname(Tname,
																									     encode_query_topic_info_attr_tid(Tid,
																													      xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																																	 __TopXMLNS))))))),
    {xmlel, <<"query_topic_info">>, _attrs, _els}.

'encode_query_topic_info_$user_item'([], __TopXMLNS,
				     _acc) ->
    _acc;
'encode_query_topic_info_$user_item'([User_item | _els],
				     __TopXMLNS, _acc) ->
    'encode_query_topic_info_$user_item'(_els, __TopXMLNS,
					 [encode_topic_user_item(User_item,
								 __TopXMLNS)
					  | _acc]).

decode_query_topic_info_attr_tid(__TopXMLNS,
				 undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"tid">>, <<"query_topic_info">>,
		   __TopXMLNS}});
decode_query_topic_info_attr_tid(__TopXMLNS, _val) ->
    _val.

encode_query_topic_info_attr_tid(_val, _acc) ->
    [{<<"tid">>, _val} | _acc].

decode_query_topic_info_attr_tname(__TopXMLNS,
				   undefined) ->
    <<>>;
decode_query_topic_info_attr_tname(__TopXMLNS, _val) ->
    _val.

encode_query_topic_info_attr_tname(<<>>, _acc) -> _acc;
encode_query_topic_info_attr_tname(_val, _acc) ->
    [{<<"tname">>, _val} | _acc].

decode_query_topic_info_attr_tcreater(__TopXMLNS,
				      undefined) ->
    undefined;
decode_query_topic_info_attr_tcreater(__TopXMLNS,
				      _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({xmpp_codec,
			{bad_attr_value, <<"tcreater">>, <<"query_topic_info">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_query_topic_info_attr_tcreater(undefined,
				      _acc) ->
    _acc;
encode_query_topic_info_attr_tcreater(_val, _acc) ->
    [{<<"tcreater">>, jid:encode(_val)} | _acc].

decode_query_topic_info_attr_tcreate_time(__TopXMLNS,
					  undefined) ->
    <<>>;
decode_query_topic_info_attr_tcreate_time(__TopXMLNS,
					  _val) ->
    _val.

encode_query_topic_info_attr_tcreate_time(<<>>, _acc) ->
    _acc;
encode_query_topic_info_attr_tcreate_time(_val, _acc) ->
    [{<<"tcreate_time">>, _val} | _acc].

decode_query_topic_info_attr_topic_type(__TopXMLNS,
					undefined) ->
    <<>>;
decode_query_topic_info_attr_topic_type(__TopXMLNS,
					_val) ->
    _val.

encode_query_topic_info_attr_topic_type(<<>>, _acc) ->
    _acc;
encode_query_topic_info_attr_topic_type(_val, _acc) ->
    [{<<"topic_type">>, _val} | _acc].

decode_query_topic_info_attr_tmaxnum(__TopXMLNS,
				     undefined) ->
    <<>>;
decode_query_topic_info_attr_tmaxnum(__TopXMLNS,
				     _val) ->
    _val.

encode_query_topic_info_attr_tmaxnum(<<>>, _acc) ->
    _acc;
encode_query_topic_info_attr_tmaxnum(_val, _acc) ->
    [{<<"tmaxnum">>, _val} | _acc].

decode_topic_user_item(__TopXMLNS, __Opts,
		       {xmlel, <<"topic_user_item">>, _attrs, _els}) ->
    {User, Server, Nick, Addtime} =
	decode_topic_user_item_attrs(__TopXMLNS, _attrs,
				     undefined, undefined, undefined,
				     undefined),
    {topic_user_item, User, Server, Nick, Addtime}.

decode_topic_user_item_attrs(__TopXMLNS,
			     [{<<"user">>, _val} | _attrs], _User, Server, Nick,
			     Addtime) ->
    decode_topic_user_item_attrs(__TopXMLNS, _attrs, _val,
				 Server, Nick, Addtime);
decode_topic_user_item_attrs(__TopXMLNS,
			     [{<<"server">>, _val} | _attrs], User, _Server,
			     Nick, Addtime) ->
    decode_topic_user_item_attrs(__TopXMLNS, _attrs, User,
				 _val, Nick, Addtime);
decode_topic_user_item_attrs(__TopXMLNS,
			     [{<<"nick">>, _val} | _attrs], User, Server, _Nick,
			     Addtime) ->
    decode_topic_user_item_attrs(__TopXMLNS, _attrs, User,
				 Server, _val, Addtime);
decode_topic_user_item_attrs(__TopXMLNS,
			     [{<<"addtime">>, _val} | _attrs], User, Server,
			     Nick, _Addtime) ->
    decode_topic_user_item_attrs(__TopXMLNS, _attrs, User,
				 Server, Nick, _val);
decode_topic_user_item_attrs(__TopXMLNS, [_ | _attrs],
			     User, Server, Nick, Addtime) ->
    decode_topic_user_item_attrs(__TopXMLNS, _attrs, User,
				 Server, Nick, Addtime);
decode_topic_user_item_attrs(__TopXMLNS, [], User,
			     Server, Nick, Addtime) ->
    {decode_topic_user_item_attr_user(__TopXMLNS, User),
     decode_topic_user_item_attr_server(__TopXMLNS, Server),
     decode_topic_user_item_attr_nick(__TopXMLNS, Nick),
     decode_topic_user_item_attr_addtime(__TopXMLNS,
					 Addtime)}.

encode_topic_user_item({topic_user_item, User, Server,
			Nick, Addtime},
		       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:topic">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = encode_topic_user_item_attr_addtime(Addtime,
						 encode_topic_user_item_attr_nick(Nick,
										  encode_topic_user_item_attr_server(Server,
														     encode_topic_user_item_attr_user(User,
																		      xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																						 __TopXMLNS))))),
    {xmlel, <<"topic_user_item">>, _attrs, _els}.

decode_topic_user_item_attr_user(__TopXMLNS,
				 undefined) ->
    <<>>;
decode_topic_user_item_attr_user(__TopXMLNS, _val) ->
    _val.

encode_topic_user_item_attr_user(<<>>, _acc) -> _acc;
encode_topic_user_item_attr_user(_val, _acc) ->
    [{<<"user">>, _val} | _acc].

decode_topic_user_item_attr_server(__TopXMLNS,
				   undefined) ->
    <<>>;
decode_topic_user_item_attr_server(__TopXMLNS, _val) ->
    _val.

encode_topic_user_item_attr_server(<<>>, _acc) -> _acc;
encode_topic_user_item_attr_server(_val, _acc) ->
    [{<<"server">>, _val} | _acc].

decode_topic_user_item_attr_nick(__TopXMLNS,
				 undefined) ->
    <<>>;
decode_topic_user_item_attr_nick(__TopXMLNS, _val) ->
    _val.

encode_topic_user_item_attr_nick(<<>>, _acc) -> _acc;
encode_topic_user_item_attr_nick(_val, _acc) ->
    [{<<"nick">>, _val} | _acc].

decode_topic_user_item_attr_addtime(__TopXMLNS,
				    undefined) ->
    <<>>;
decode_topic_user_item_attr_addtime(__TopXMLNS, _val) ->
    _val.

encode_topic_user_item_attr_addtime(<<>>, _acc) -> _acc;
encode_topic_user_item_attr_addtime(_val, _acc) ->
    [{<<"addtime">>, _val} | _acc].
