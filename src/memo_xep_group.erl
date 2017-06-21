%% Created automatically by XML generator (fxml_gen.erl)
%% Source: memo_codec.spec

-module(memo_xep_group).

-compile(export_all).

do_decode(<<"query">>, <<"jabber:memo:group">>, El,
	  Opts) ->
    decode_memo_group(<<"jabber:memo:group">>, Opts, El);
do_decode(<<"query_group_info">>,
	  <<"jabber:memo:group">>, El, Opts) ->
    decode_query_group_info(<<"jabber:memo:group">>, Opts,
			    El);
do_decode(<<"group_user_item">>,
	  <<"jabber:memo:group">>, El, Opts) ->
    decode_group_user_item(<<"jabber:memo:group">>, Opts,
			   El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({memo_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({memo_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"query">>, <<"jabber:memo:group">>},
     {<<"query_group_info">>, <<"jabber:memo:group">>},
     {<<"group_user_item">>, <<"jabber:memo:group">>}].

do_encode({group_user_item, _, _, _, _} =
	      Group_user_item,
	  TopXMLNS) ->
    encode_group_user_item(Group_user_item, TopXMLNS);
do_encode({query_group_info, _, _, _, _, _, _, _, _} =
	      Query_group_info,
	  TopXMLNS) ->
    encode_query_group_info(Query_group_info, TopXMLNS);
do_encode({memo_group, _, _, _} = Query, TopXMLNS) ->
    encode_memo_group(Query, TopXMLNS).

do_get_name({group_user_item, _, _, _, _}) ->
    <<"group_user_item">>;
do_get_name({memo_group, _, _, _}) -> <<"query">>;
do_get_name({query_group_info, _, _, _, _, _, _, _,
	     _}) ->
    <<"query_group_info">>.

do_get_ns({group_user_item, _, _, _, _}) ->
    <<"jabber:memo:group">>;
do_get_ns({memo_group, _, _, _}) ->
    <<"jabber:memo:group">>;
do_get_ns({query_group_info, _, _, _, _, _, _, _, _}) ->
    <<"jabber:memo:group">>.

pp(group_user_item, 4) -> [user, server, nick, role];
pp(query_group_info, 8) ->
    [otype, targetuser, gid, gname, group_type, maxuser,
     gcreater, user_items];
pp(memo_group, 3) -> [rtype, group_info, group_type];
pp(_, _) -> no.

records() ->
    [{group_user_item, 4}, {query_group_info, 8},
     {memo_group, 3}].

decode_memo_group(__TopXMLNS, __Opts,
		  {xmlel, <<"query">>, _attrs, _els}) ->
    Group_info = decode_memo_group_els(__TopXMLNS, __Opts,
				       _els, undefined),
    {Rtype, Group_type} =
	decode_memo_group_attrs(__TopXMLNS, _attrs, undefined,
				undefined),
    {memo_group, Rtype, Group_info, Group_type}.

decode_memo_group_els(__TopXMLNS, __Opts, [],
		      Group_info) ->
    Group_info;
decode_memo_group_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"query_group_info">>, _attrs, _} = _el
		       | _els],
		      Group_info) ->
    case memo_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:memo:group">> ->
	  decode_memo_group_els(__TopXMLNS, __Opts, _els,
				decode_query_group_info(<<"jabber:memo:group">>,
							__Opts, _el));
      _ ->
	  decode_memo_group_els(__TopXMLNS, __Opts, _els,
				Group_info)
    end;
decode_memo_group_els(__TopXMLNS, __Opts, [_ | _els],
		      Group_info) ->
    decode_memo_group_els(__TopXMLNS, __Opts, _els,
			  Group_info).

decode_memo_group_attrs(__TopXMLNS,
			[{<<"rtype">>, _val} | _attrs], _Rtype, Group_type) ->
    decode_memo_group_attrs(__TopXMLNS, _attrs, _val,
			    Group_type);
decode_memo_group_attrs(__TopXMLNS,
			[{<<"group_type">>, _val} | _attrs], Rtype,
			_Group_type) ->
    decode_memo_group_attrs(__TopXMLNS, _attrs, Rtype,
			    _val);
decode_memo_group_attrs(__TopXMLNS, [_ | _attrs], Rtype,
			Group_type) ->
    decode_memo_group_attrs(__TopXMLNS, _attrs, Rtype,
			    Group_type);
decode_memo_group_attrs(__TopXMLNS, [], Rtype,
			Group_type) ->
    {decode_memo_group_attr_rtype(__TopXMLNS, Rtype),
     decode_memo_group_attr_group_type(__TopXMLNS,
				       Group_type)}.

encode_memo_group({memo_group, Rtype, Group_info,
		   Group_type},
		  __TopXMLNS) ->
    __NewTopXMLNS =
	memo_codec:choose_top_xmlns(<<"jabber:memo:group">>, [],
				    __TopXMLNS),
    _els =
	lists:reverse('encode_memo_group_$group_info'(Group_info,
						      __NewTopXMLNS, [])),
    _attrs = encode_memo_group_attr_group_type(Group_type,
					       encode_memo_group_attr_rtype(Rtype,
									    memo_codec:enc_xmlns_attrs(__NewTopXMLNS,
												       __TopXMLNS))),
    {xmlel, <<"query">>, _attrs, _els}.

'encode_memo_group_$group_info'(undefined, __TopXMLNS,
				_acc) ->
    _acc;
'encode_memo_group_$group_info'(Group_info, __TopXMLNS,
				_acc) ->
    [encode_query_group_info(Group_info, __TopXMLNS)
     | _acc].

decode_memo_group_attr_rtype(__TopXMLNS, undefined) ->
    <<>>;
decode_memo_group_attr_rtype(__TopXMLNS, _val) -> _val.

encode_memo_group_attr_rtype(<<>>, _acc) -> _acc;
encode_memo_group_attr_rtype(_val, _acc) ->
    [{<<"rtype">>, _val} | _acc].

decode_memo_group_attr_group_type(__TopXMLNS,
				  undefined) ->
    <<>>;
decode_memo_group_attr_group_type(__TopXMLNS, _val) ->
    _val.

encode_memo_group_attr_group_type(<<>>, _acc) -> _acc;
encode_memo_group_attr_group_type(_val, _acc) ->
    [{<<"group_type">>, _val} | _acc].

decode_query_group_info(__TopXMLNS, __Opts,
			{xmlel, <<"query_group_info">>, _attrs, _els}) ->
    User_items = decode_query_group_info_els(__TopXMLNS,
					     __Opts, _els, []),
    {Otype, Targetuser, Gid, Gname, Group_type, Maxuser,
     Gcreater} =
	decode_query_group_info_attrs(__TopXMLNS, _attrs,
				      undefined, undefined, undefined,
				      undefined, undefined, undefined,
				      undefined),
    {query_group_info, Otype, Targetuser, Gid, Gname,
     Group_type, Maxuser, Gcreater, User_items}.

decode_query_group_info_els(__TopXMLNS, __Opts, [],
			    User_items) ->
    lists:reverse(User_items);
decode_query_group_info_els(__TopXMLNS, __Opts,
			    [{xmlel, <<"group_user_item">>, _attrs, _} = _el
			     | _els],
			    User_items) ->
    case memo_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:memo:group">> ->
	  decode_query_group_info_els(__TopXMLNS, __Opts, _els,
				      [decode_group_user_item(<<"jabber:memo:group">>,
							      __Opts, _el)
				       | User_items]);
      _ ->
	  decode_query_group_info_els(__TopXMLNS, __Opts, _els,
				      User_items)
    end;
decode_query_group_info_els(__TopXMLNS, __Opts,
			    [_ | _els], User_items) ->
    decode_query_group_info_els(__TopXMLNS, __Opts, _els,
				User_items).

decode_query_group_info_attrs(__TopXMLNS,
			      [{<<"otype">>, _val} | _attrs], _Otype,
			      Targetuser, Gid, Gname, Group_type, Maxuser,
			      Gcreater) ->
    decode_query_group_info_attrs(__TopXMLNS, _attrs, _val,
				  Targetuser, Gid, Gname, Group_type, Maxuser,
				  Gcreater);
decode_query_group_info_attrs(__TopXMLNS,
			      [{<<"targetuser">>, _val} | _attrs], Otype,
			      _Targetuser, Gid, Gname, Group_type, Maxuser,
			      Gcreater) ->
    decode_query_group_info_attrs(__TopXMLNS, _attrs, Otype,
				  _val, Gid, Gname, Group_type, Maxuser,
				  Gcreater);
decode_query_group_info_attrs(__TopXMLNS,
			      [{<<"gid">>, _val} | _attrs], Otype, Targetuser,
			      _Gid, Gname, Group_type, Maxuser, Gcreater) ->
    decode_query_group_info_attrs(__TopXMLNS, _attrs, Otype,
				  Targetuser, _val, Gname, Group_type, Maxuser,
				  Gcreater);
decode_query_group_info_attrs(__TopXMLNS,
			      [{<<"gname">>, _val} | _attrs], Otype, Targetuser,
			      Gid, _Gname, Group_type, Maxuser, Gcreater) ->
    decode_query_group_info_attrs(__TopXMLNS, _attrs, Otype,
				  Targetuser, Gid, _val, Group_type, Maxuser,
				  Gcreater);
decode_query_group_info_attrs(__TopXMLNS,
			      [{<<"group_type">>, _val} | _attrs], Otype,
			      Targetuser, Gid, Gname, _Group_type, Maxuser,
			      Gcreater) ->
    decode_query_group_info_attrs(__TopXMLNS, _attrs, Otype,
				  Targetuser, Gid, Gname, _val, Maxuser,
				  Gcreater);
decode_query_group_info_attrs(__TopXMLNS,
			      [{<<"maxuser">>, _val} | _attrs], Otype,
			      Targetuser, Gid, Gname, Group_type, _Maxuser,
			      Gcreater) ->
    decode_query_group_info_attrs(__TopXMLNS, _attrs, Otype,
				  Targetuser, Gid, Gname, Group_type, _val,
				  Gcreater);
decode_query_group_info_attrs(__TopXMLNS,
			      [{<<"gcreater">>, _val} | _attrs], Otype,
			      Targetuser, Gid, Gname, Group_type, Maxuser,
			      _Gcreater) ->
    decode_query_group_info_attrs(__TopXMLNS, _attrs, Otype,
				  Targetuser, Gid, Gname, Group_type, Maxuser,
				  _val);
decode_query_group_info_attrs(__TopXMLNS, [_ | _attrs],
			      Otype, Targetuser, Gid, Gname, Group_type,
			      Maxuser, Gcreater) ->
    decode_query_group_info_attrs(__TopXMLNS, _attrs, Otype,
				  Targetuser, Gid, Gname, Group_type, Maxuser,
				  Gcreater);
decode_query_group_info_attrs(__TopXMLNS, [], Otype,
			      Targetuser, Gid, Gname, Group_type, Maxuser,
			      Gcreater) ->
    {decode_query_group_info_attr_otype(__TopXMLNS, Otype),
     decode_query_group_info_attr_targetuser(__TopXMLNS,
					     Targetuser),
     decode_query_group_info_attr_gid(__TopXMLNS, Gid),
     decode_query_group_info_attr_gname(__TopXMLNS, Gname),
     decode_query_group_info_attr_group_type(__TopXMLNS,
					     Group_type),
     decode_query_group_info_attr_maxuser(__TopXMLNS,
					  Maxuser),
     decode_query_group_info_attr_gcreater(__TopXMLNS,
					   Gcreater)}.

encode_query_group_info({query_group_info, Otype,
			 Targetuser, Gid, Gname, Group_type, Maxuser, Gcreater,
			 User_items},
			__TopXMLNS) ->
    __NewTopXMLNS =
	memo_codec:choose_top_xmlns(<<"jabber:memo:group">>, [],
				    __TopXMLNS),
    _els =
	lists:reverse('encode_query_group_info_$user_items'(User_items,
							    __NewTopXMLNS, [])),
    _attrs = encode_query_group_info_attr_gcreater(Gcreater,
						   encode_query_group_info_attr_maxuser(Maxuser,
											encode_query_group_info_attr_group_type(Group_type,
																encode_query_group_info_attr_gname(Gname,
																				   encode_query_group_info_attr_gid(Gid,
																								    encode_query_group_info_attr_targetuser(Targetuser,
																													    encode_query_group_info_attr_otype(Otype,
																																	       memo_codec:enc_xmlns_attrs(__NewTopXMLNS,
																																					  __TopXMLNS)))))))),
    {xmlel, <<"query_group_info">>, _attrs, _els}.

'encode_query_group_info_$user_items'([], __TopXMLNS,
				      _acc) ->
    _acc;
'encode_query_group_info_$user_items'([User_items
				       | _els],
				      __TopXMLNS, _acc) ->
    'encode_query_group_info_$user_items'(_els, __TopXMLNS,
					  [encode_group_user_item(User_items,
								  __TopXMLNS)
					   | _acc]).

decode_query_group_info_attr_otype(__TopXMLNS,
				   undefined) ->
    <<>>;
decode_query_group_info_attr_otype(__TopXMLNS, _val) ->
    _val.

encode_query_group_info_attr_otype(<<>>, _acc) -> _acc;
encode_query_group_info_attr_otype(_val, _acc) ->
    [{<<"otype">>, _val} | _acc].

decode_query_group_info_attr_targetuser(__TopXMLNS,
					undefined) ->
    <<>>;
decode_query_group_info_attr_targetuser(__TopXMLNS,
					_val) ->
    _val.

encode_query_group_info_attr_targetuser(<<>>, _acc) ->
    _acc;
encode_query_group_info_attr_targetuser(_val, _acc) ->
    [{<<"targetuser">>, _val} | _acc].

decode_query_group_info_attr_gid(__TopXMLNS,
				 undefined) ->
    <<>>;
decode_query_group_info_attr_gid(__TopXMLNS, _val) ->
    _val.

encode_query_group_info_attr_gid(<<>>, _acc) -> _acc;
encode_query_group_info_attr_gid(_val, _acc) ->
    [{<<"gid">>, _val} | _acc].

decode_query_group_info_attr_gname(__TopXMLNS,
				   undefined) ->
    <<>>;
decode_query_group_info_attr_gname(__TopXMLNS, _val) ->
    _val.

encode_query_group_info_attr_gname(<<>>, _acc) -> _acc;
encode_query_group_info_attr_gname(_val, _acc) ->
    [{<<"gname">>, _val} | _acc].

decode_query_group_info_attr_group_type(__TopXMLNS,
					undefined) ->
    <<>>;
decode_query_group_info_attr_group_type(__TopXMLNS,
					_val) ->
    _val.

encode_query_group_info_attr_group_type(<<>>, _acc) ->
    _acc;
encode_query_group_info_attr_group_type(_val, _acc) ->
    [{<<"group_type">>, _val} | _acc].

decode_query_group_info_attr_maxuser(__TopXMLNS,
				     undefined) ->
    <<>>;
decode_query_group_info_attr_maxuser(__TopXMLNS,
				     _val) ->
    _val.

encode_query_group_info_attr_maxuser(<<>>, _acc) ->
    _acc;
encode_query_group_info_attr_maxuser(_val, _acc) ->
    [{<<"maxuser">>, _val} | _acc].

decode_query_group_info_attr_gcreater(__TopXMLNS,
				      undefined) ->
    undefined;
decode_query_group_info_attr_gcreater(__TopXMLNS,
				      _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({memo_codec,
			{bad_attr_value, <<"gcreater">>, <<"query_group_info">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_query_group_info_attr_gcreater(undefined,
				      _acc) ->
    _acc;
encode_query_group_info_attr_gcreater(_val, _acc) ->
    [{<<"gcreater">>, jid:encode(_val)} | _acc].

decode_group_user_item(__TopXMLNS, __Opts,
		       {xmlel, <<"group_user_item">>, _attrs, _els}) ->
    {User, Server, Nick, Role} =
	decode_group_user_item_attrs(__TopXMLNS, _attrs,
				     undefined, undefined, undefined,
				     undefined),
    {group_user_item, User, Server, Nick, Role}.

decode_group_user_item_attrs(__TopXMLNS,
			     [{<<"user">>, _val} | _attrs], _User, Server, Nick,
			     Role) ->
    decode_group_user_item_attrs(__TopXMLNS, _attrs, _val,
				 Server, Nick, Role);
decode_group_user_item_attrs(__TopXMLNS,
			     [{<<"server">>, _val} | _attrs], User, _Server,
			     Nick, Role) ->
    decode_group_user_item_attrs(__TopXMLNS, _attrs, User,
				 _val, Nick, Role);
decode_group_user_item_attrs(__TopXMLNS,
			     [{<<"nick">>, _val} | _attrs], User, Server, _Nick,
			     Role) ->
    decode_group_user_item_attrs(__TopXMLNS, _attrs, User,
				 Server, _val, Role);
decode_group_user_item_attrs(__TopXMLNS,
			     [{<<"role">>, _val} | _attrs], User, Server, Nick,
			     _Role) ->
    decode_group_user_item_attrs(__TopXMLNS, _attrs, User,
				 Server, Nick, _val);
decode_group_user_item_attrs(__TopXMLNS, [_ | _attrs],
			     User, Server, Nick, Role) ->
    decode_group_user_item_attrs(__TopXMLNS, _attrs, User,
				 Server, Nick, Role);
decode_group_user_item_attrs(__TopXMLNS, [], User,
			     Server, Nick, Role) ->
    {decode_group_user_item_attr_user(__TopXMLNS, User),
     decode_group_user_item_attr_server(__TopXMLNS, Server),
     decode_group_user_item_attr_nick(__TopXMLNS, Nick),
     decode_group_user_item_attr_role(__TopXMLNS, Role)}.

encode_group_user_item({group_user_item, User, Server,
			Nick, Role},
		       __TopXMLNS) ->
    __NewTopXMLNS =
	memo_codec:choose_top_xmlns(<<"jabber:memo:group">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = encode_group_user_item_attr_role(Role,
					      encode_group_user_item_attr_nick(Nick,
									       encode_group_user_item_attr_server(Server,
														  encode_group_user_item_attr_user(User,
																		   memo_codec:enc_xmlns_attrs(__NewTopXMLNS,
																					      __TopXMLNS))))),
    {xmlel, <<"group_user_item">>, _attrs, _els}.

decode_group_user_item_attr_user(__TopXMLNS,
				 undefined) ->
    <<>>;
decode_group_user_item_attr_user(__TopXMLNS, _val) ->
    _val.

encode_group_user_item_attr_user(<<>>, _acc) -> _acc;
encode_group_user_item_attr_user(_val, _acc) ->
    [{<<"user">>, _val} | _acc].

decode_group_user_item_attr_server(__TopXMLNS,
				   undefined) ->
    <<>>;
decode_group_user_item_attr_server(__TopXMLNS, _val) ->
    _val.

encode_group_user_item_attr_server(<<>>, _acc) -> _acc;
encode_group_user_item_attr_server(_val, _acc) ->
    [{<<"server">>, _val} | _acc].

decode_group_user_item_attr_nick(__TopXMLNS,
				 undefined) ->
    <<>>;
decode_group_user_item_attr_nick(__TopXMLNS, _val) ->
    _val.

encode_group_user_item_attr_nick(<<>>, _acc) -> _acc;
encode_group_user_item_attr_nick(_val, _acc) ->
    [{<<"nick">>, _val} | _acc].

decode_group_user_item_attr_role(__TopXMLNS,
				 undefined) ->
    <<>>;
decode_group_user_item_attr_role(__TopXMLNS, _val) ->
    _val.

encode_group_user_item_attr_role(<<>>, _acc) -> _acc;
encode_group_user_item_attr_role(_val, _acc) ->
    [{<<"role">>, _val} | _acc].
