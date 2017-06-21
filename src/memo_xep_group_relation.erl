%% Created automatically by XML generator (fxml_gen.erl)
%% Source: memo_codec.spec

-module(memo_xep_group_relation).

-compile(export_all).

do_decode(<<"query">>, <<"jabber:memo:group:relation">>,
	  El, Opts) ->
    decode_memo_group_relation(<<"jabber:memo:group:relation">>,
			       Opts, El);
do_decode(<<"request_info">>,
	  <<"jabber:memo:group:relation">>, El, Opts) ->
    decode_group_relation_request(<<"jabber:memo:group:relation">>,
				  Opts, El);
do_decode(<<"group_item">>,
	  <<"jabber:memo:group:relation">>, El, Opts) ->
    decode_group_item(<<"jabber:memo:group:relation">>,
		      Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({memo_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({memo_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"query">>, <<"jabber:memo:group:relation">>},
     {<<"request_info">>, <<"jabber:memo:group:relation">>},
     {<<"group_item">>, <<"jabber:memo:group:relation">>}].

do_encode({group_item, _, _, _, _, _, _, _} =
	      Group_item,
	  TopXMLNS) ->
    encode_group_item(Group_item, TopXMLNS);
do_encode({request_info, _, _, _, _, _, _} =
	      Request_info,
	  TopXMLNS) ->
    encode_group_relation_request(Request_info, TopXMLNS);
do_encode({memo_group_relation, _, _, _, _} = Query,
	  TopXMLNS) ->
    encode_memo_group_relation(Query, TopXMLNS).

do_get_name({group_item, _, _, _, _, _, _, _}) ->
    <<"group_item">>;
do_get_name({memo_group_relation, _, _, _, _}) ->
    <<"query">>;
do_get_name({request_info, _, _, _, _, _, _}) ->
    <<"request_info">>.

do_get_ns({group_item, _, _, _, _, _, _, _}) ->
    <<"jabber:memo:group:relation">>;
do_get_ns({memo_group_relation, _, _, _, _}) ->
    <<"jabber:memo:group:relation">>;
do_get_ns({request_info, _, _, _, _, _, _}) ->
    <<"jabber:memo:group:relation">>.

pp(group_item, 7) ->
    [gid, gname, group_type, gcreater, role, photo,
     maxuser];
pp(request_info, 6) ->
    [sub_type, ask_msg, join_user, invite_user, out_user,
     invited_user];
pp(memo_group_relation, 4) ->
    [rtype, gid, request_info, group_items];
pp(_, _) -> no.

records() ->
    [{group_item, 7}, {request_info, 6},
     {memo_group_relation, 4}].

decode_memo_group_relation(__TopXMLNS, __Opts,
			   {xmlel, <<"query">>, _attrs, _els}) ->
    {Group_items, Request_info} =
	decode_memo_group_relation_els(__TopXMLNS, __Opts, _els,
				       [], undefined),
    {Rtype, Gid} =
	decode_memo_group_relation_attrs(__TopXMLNS, _attrs,
					 undefined, undefined),
    {memo_group_relation, Rtype, Gid, Request_info,
     Group_items}.

decode_memo_group_relation_els(__TopXMLNS, __Opts, [],
			       Group_items, Request_info) ->
    {lists:reverse(Group_items), Request_info};
decode_memo_group_relation_els(__TopXMLNS, __Opts,
			       [{xmlel, <<"group_item">>, _attrs, _} = _el
				| _els],
			       Group_items, Request_info) ->
    case memo_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:memo:group:relation">> ->
	  decode_memo_group_relation_els(__TopXMLNS, __Opts, _els,
					 [decode_group_item(<<"jabber:memo:group:relation">>,
							    __Opts, _el)
					  | Group_items],
					 Request_info);
      _ ->
	  decode_memo_group_relation_els(__TopXMLNS, __Opts, _els,
					 Group_items, Request_info)
    end;
decode_memo_group_relation_els(__TopXMLNS, __Opts,
			       [{xmlel, <<"request_info">>, _attrs, _} = _el
				| _els],
			       Group_items, Request_info) ->
    case memo_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:memo:group:relation">> ->
	  decode_memo_group_relation_els(__TopXMLNS, __Opts, _els,
					 Group_items,
					 decode_group_relation_request(<<"jabber:memo:group:relation">>,
								       __Opts,
								       _el));
      _ ->
	  decode_memo_group_relation_els(__TopXMLNS, __Opts, _els,
					 Group_items, Request_info)
    end;
decode_memo_group_relation_els(__TopXMLNS, __Opts,
			       [_ | _els], Group_items, Request_info) ->
    decode_memo_group_relation_els(__TopXMLNS, __Opts, _els,
				   Group_items, Request_info).

decode_memo_group_relation_attrs(__TopXMLNS,
				 [{<<"rtype">>, _val} | _attrs], _Rtype, Gid) ->
    decode_memo_group_relation_attrs(__TopXMLNS, _attrs,
				     _val, Gid);
decode_memo_group_relation_attrs(__TopXMLNS,
				 [{<<"gid">>, _val} | _attrs], Rtype, _Gid) ->
    decode_memo_group_relation_attrs(__TopXMLNS, _attrs,
				     Rtype, _val);
decode_memo_group_relation_attrs(__TopXMLNS,
				 [_ | _attrs], Rtype, Gid) ->
    decode_memo_group_relation_attrs(__TopXMLNS, _attrs,
				     Rtype, Gid);
decode_memo_group_relation_attrs(__TopXMLNS, [], Rtype,
				 Gid) ->
    {decode_memo_group_relation_attr_rtype(__TopXMLNS,
					   Rtype),
     decode_memo_group_relation_attr_gid(__TopXMLNS, Gid)}.

encode_memo_group_relation({memo_group_relation, Rtype,
			    Gid, Request_info, Group_items},
			   __TopXMLNS) ->
    __NewTopXMLNS =
	memo_codec:choose_top_xmlns(<<"jabber:memo:group:relation">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_memo_group_relation_$group_items'(Group_items,
								__NewTopXMLNS,
								'encode_memo_group_relation_$request_info'(Request_info,
													   __NewTopXMLNS,
													   []))),
    _attrs = encode_memo_group_relation_attr_gid(Gid,
						 encode_memo_group_relation_attr_rtype(Rtype,
										       memo_codec:enc_xmlns_attrs(__NewTopXMLNS,
														  __TopXMLNS))),
    {xmlel, <<"query">>, _attrs, _els}.

'encode_memo_group_relation_$group_items'([],
					  __TopXMLNS, _acc) ->
    _acc;
'encode_memo_group_relation_$group_items'([Group_items
					   | _els],
					  __TopXMLNS, _acc) ->
    'encode_memo_group_relation_$group_items'(_els,
					      __TopXMLNS,
					      [encode_group_item(Group_items,
								 __TopXMLNS)
					       | _acc]).

'encode_memo_group_relation_$request_info'(undefined,
					   __TopXMLNS, _acc) ->
    _acc;
'encode_memo_group_relation_$request_info'(Request_info,
					   __TopXMLNS, _acc) ->
    [encode_group_relation_request(Request_info, __TopXMLNS)
     | _acc].

decode_memo_group_relation_attr_rtype(__TopXMLNS,
				      undefined) ->
    <<>>;
decode_memo_group_relation_attr_rtype(__TopXMLNS,
				      _val) ->
    _val.

encode_memo_group_relation_attr_rtype(<<>>, _acc) ->
    _acc;
encode_memo_group_relation_attr_rtype(_val, _acc) ->
    [{<<"rtype">>, _val} | _acc].

decode_memo_group_relation_attr_gid(__TopXMLNS,
				    undefined) ->
    <<>>;
decode_memo_group_relation_attr_gid(__TopXMLNS, _val) ->
    _val.

encode_memo_group_relation_attr_gid(<<>>, _acc) -> _acc;
encode_memo_group_relation_attr_gid(_val, _acc) ->
    [{<<"gid">>, _val} | _acc].

decode_group_relation_request(__TopXMLNS, __Opts,
			      {xmlel, <<"request_info">>, _attrs, _els}) ->
    {Sub_type, Ask_msg, Join_user, Invite_user, Out_user,
     Invited_user} =
	decode_group_relation_request_attrs(__TopXMLNS, _attrs,
					    undefined, undefined, undefined,
					    undefined, undefined, undefined),
    {request_info, Sub_type, Ask_msg, Join_user,
     Invite_user, Out_user, Invited_user}.

decode_group_relation_request_attrs(__TopXMLNS,
				    [{<<"sub_type">>, _val} | _attrs],
				    _Sub_type, Ask_msg, Join_user, Invite_user,
				    Out_user, Invited_user) ->
    decode_group_relation_request_attrs(__TopXMLNS, _attrs,
					_val, Ask_msg, Join_user, Invite_user,
					Out_user, Invited_user);
decode_group_relation_request_attrs(__TopXMLNS,
				    [{<<"ask_msg">>, _val} | _attrs], Sub_type,
				    _Ask_msg, Join_user, Invite_user, Out_user,
				    Invited_user) ->
    decode_group_relation_request_attrs(__TopXMLNS, _attrs,
					Sub_type, _val, Join_user, Invite_user,
					Out_user, Invited_user);
decode_group_relation_request_attrs(__TopXMLNS,
				    [{<<"join_user">>, _val} | _attrs],
				    Sub_type, Ask_msg, _Join_user, Invite_user,
				    Out_user, Invited_user) ->
    decode_group_relation_request_attrs(__TopXMLNS, _attrs,
					Sub_type, Ask_msg, _val, Invite_user,
					Out_user, Invited_user);
decode_group_relation_request_attrs(__TopXMLNS,
				    [{<<"invite_user">>, _val} | _attrs],
				    Sub_type, Ask_msg, Join_user, _Invite_user,
				    Out_user, Invited_user) ->
    decode_group_relation_request_attrs(__TopXMLNS, _attrs,
					Sub_type, Ask_msg, Join_user, _val,
					Out_user, Invited_user);
decode_group_relation_request_attrs(__TopXMLNS,
				    [{<<"out_user">>, _val} | _attrs], Sub_type,
				    Ask_msg, Join_user, Invite_user, _Out_user,
				    Invited_user) ->
    decode_group_relation_request_attrs(__TopXMLNS, _attrs,
					Sub_type, Ask_msg, Join_user,
					Invite_user, _val, Invited_user);
decode_group_relation_request_attrs(__TopXMLNS,
				    [{<<"invited_user">>, _val} | _attrs],
				    Sub_type, Ask_msg, Join_user, Invite_user,
				    Out_user, _Invited_user) ->
    decode_group_relation_request_attrs(__TopXMLNS, _attrs,
					Sub_type, Ask_msg, Join_user,
					Invite_user, Out_user, _val);
decode_group_relation_request_attrs(__TopXMLNS,
				    [_ | _attrs], Sub_type, Ask_msg, Join_user,
				    Invite_user, Out_user, Invited_user) ->
    decode_group_relation_request_attrs(__TopXMLNS, _attrs,
					Sub_type, Ask_msg, Join_user,
					Invite_user, Out_user, Invited_user);
decode_group_relation_request_attrs(__TopXMLNS, [],
				    Sub_type, Ask_msg, Join_user, Invite_user,
				    Out_user, Invited_user) ->
    {decode_group_relation_request_attr_sub_type(__TopXMLNS,
						 Sub_type),
     decode_group_relation_request_attr_ask_msg(__TopXMLNS,
						Ask_msg),
     decode_group_relation_request_attr_join_user(__TopXMLNS,
						  Join_user),
     decode_group_relation_request_attr_invite_user(__TopXMLNS,
						    Invite_user),
     decode_group_relation_request_attr_out_user(__TopXMLNS,
						 Out_user),
     decode_group_relation_request_attr_invited_user(__TopXMLNS,
						     Invited_user)}.

encode_group_relation_request({request_info, Sub_type,
			       Ask_msg, Join_user, Invite_user, Out_user,
			       Invited_user},
			      __TopXMLNS) ->
    __NewTopXMLNS =
	memo_codec:choose_top_xmlns(<<"jabber:memo:group:relation">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs =
	encode_group_relation_request_attr_invited_user(Invited_user,
							encode_group_relation_request_attr_out_user(Out_user,
												    encode_group_relation_request_attr_invite_user(Invite_user,
																		   encode_group_relation_request_attr_join_user(Join_user,
																								encode_group_relation_request_attr_ask_msg(Ask_msg,
																													   encode_group_relation_request_attr_sub_type(Sub_type,
																																		       memo_codec:enc_xmlns_attrs(__NewTopXMLNS,
																																						  __TopXMLNS))))))),
    {xmlel, <<"request_info">>, _attrs, _els}.

decode_group_relation_request_attr_sub_type(__TopXMLNS,
					    undefined) ->
    <<>>;
decode_group_relation_request_attr_sub_type(__TopXMLNS,
					    _val) ->
    _val.

encode_group_relation_request_attr_sub_type(<<>>,
					    _acc) ->
    _acc;
encode_group_relation_request_attr_sub_type(_val,
					    _acc) ->
    [{<<"sub_type">>, _val} | _acc].

decode_group_relation_request_attr_ask_msg(__TopXMLNS,
					   undefined) ->
    <<>>;
decode_group_relation_request_attr_ask_msg(__TopXMLNS,
					   _val) ->
    _val.

encode_group_relation_request_attr_ask_msg(<<>>,
					   _acc) ->
    _acc;
encode_group_relation_request_attr_ask_msg(_val,
					   _acc) ->
    [{<<"ask_msg">>, _val} | _acc].

decode_group_relation_request_attr_join_user(__TopXMLNS,
					     undefined) ->
    <<>>;
decode_group_relation_request_attr_join_user(__TopXMLNS,
					     _val) ->
    _val.

encode_group_relation_request_attr_join_user(<<>>,
					     _acc) ->
    _acc;
encode_group_relation_request_attr_join_user(_val,
					     _acc) ->
    [{<<"join_user">>, _val} | _acc].

decode_group_relation_request_attr_invite_user(__TopXMLNS,
					       undefined) ->
    <<>>;
decode_group_relation_request_attr_invite_user(__TopXMLNS,
					       _val) ->
    _val.

encode_group_relation_request_attr_invite_user(<<>>,
					       _acc) ->
    _acc;
encode_group_relation_request_attr_invite_user(_val,
					       _acc) ->
    [{<<"invite_user">>, _val} | _acc].

decode_group_relation_request_attr_out_user(__TopXMLNS,
					    undefined) ->
    <<>>;
decode_group_relation_request_attr_out_user(__TopXMLNS,
					    _val) ->
    _val.

encode_group_relation_request_attr_out_user(<<>>,
					    _acc) ->
    _acc;
encode_group_relation_request_attr_out_user(_val,
					    _acc) ->
    [{<<"out_user">>, _val} | _acc].

decode_group_relation_request_attr_invited_user(__TopXMLNS,
						undefined) ->
    <<>>;
decode_group_relation_request_attr_invited_user(__TopXMLNS,
						_val) ->
    _val.

encode_group_relation_request_attr_invited_user(<<>>,
						_acc) ->
    _acc;
encode_group_relation_request_attr_invited_user(_val,
						_acc) ->
    [{<<"invited_user">>, _val} | _acc].

decode_group_item(__TopXMLNS, __Opts,
		  {xmlel, <<"group_item">>, _attrs, _els}) ->
    {Gid, Gname, Group_type, Maxuser, Role, Photo,
     Gcreater} =
	decode_group_item_attrs(__TopXMLNS, _attrs, undefined,
				undefined, undefined, undefined, undefined,
				undefined, undefined),
    {group_item, Gid, Gname, Group_type, Gcreater, Role,
     Photo, Maxuser}.

decode_group_item_attrs(__TopXMLNS,
			[{<<"gid">>, _val} | _attrs], _Gid, Gname, Group_type,
			Maxuser, Role, Photo, Gcreater) ->
    decode_group_item_attrs(__TopXMLNS, _attrs, _val, Gname,
			    Group_type, Maxuser, Role, Photo, Gcreater);
decode_group_item_attrs(__TopXMLNS,
			[{<<"gname">>, _val} | _attrs], Gid, _Gname, Group_type,
			Maxuser, Role, Photo, Gcreater) ->
    decode_group_item_attrs(__TopXMLNS, _attrs, Gid, _val,
			    Group_type, Maxuser, Role, Photo, Gcreater);
decode_group_item_attrs(__TopXMLNS,
			[{<<"group_type">>, _val} | _attrs], Gid, Gname,
			_Group_type, Maxuser, Role, Photo, Gcreater) ->
    decode_group_item_attrs(__TopXMLNS, _attrs, Gid, Gname,
			    _val, Maxuser, Role, Photo, Gcreater);
decode_group_item_attrs(__TopXMLNS,
			[{<<"maxuser">>, _val} | _attrs], Gid, Gname,
			Group_type, _Maxuser, Role, Photo, Gcreater) ->
    decode_group_item_attrs(__TopXMLNS, _attrs, Gid, Gname,
			    Group_type, _val, Role, Photo, Gcreater);
decode_group_item_attrs(__TopXMLNS,
			[{<<"role">>, _val} | _attrs], Gid, Gname, Group_type,
			Maxuser, _Role, Photo, Gcreater) ->
    decode_group_item_attrs(__TopXMLNS, _attrs, Gid, Gname,
			    Group_type, Maxuser, _val, Photo, Gcreater);
decode_group_item_attrs(__TopXMLNS,
			[{<<"photo">>, _val} | _attrs], Gid, Gname, Group_type,
			Maxuser, Role, _Photo, Gcreater) ->
    decode_group_item_attrs(__TopXMLNS, _attrs, Gid, Gname,
			    Group_type, Maxuser, Role, _val, Gcreater);
decode_group_item_attrs(__TopXMLNS,
			[{<<"gcreater">>, _val} | _attrs], Gid, Gname,
			Group_type, Maxuser, Role, Photo, _Gcreater) ->
    decode_group_item_attrs(__TopXMLNS, _attrs, Gid, Gname,
			    Group_type, Maxuser, Role, Photo, _val);
decode_group_item_attrs(__TopXMLNS, [_ | _attrs], Gid,
			Gname, Group_type, Maxuser, Role, Photo, Gcreater) ->
    decode_group_item_attrs(__TopXMLNS, _attrs, Gid, Gname,
			    Group_type, Maxuser, Role, Photo, Gcreater);
decode_group_item_attrs(__TopXMLNS, [], Gid, Gname,
			Group_type, Maxuser, Role, Photo, Gcreater) ->
    {decode_group_item_attr_gid(__TopXMLNS, Gid),
     decode_group_item_attr_gname(__TopXMLNS, Gname),
     decode_group_item_attr_group_type(__TopXMLNS,
				       Group_type),
     decode_group_item_attr_maxuser(__TopXMLNS, Maxuser),
     decode_group_item_attr_role(__TopXMLNS, Role),
     decode_group_item_attr_photo(__TopXMLNS, Photo),
     decode_group_item_attr_gcreater(__TopXMLNS, Gcreater)}.

encode_group_item({group_item, Gid, Gname, Group_type,
		   Gcreater, Role, Photo, Maxuser},
		  __TopXMLNS) ->
    __NewTopXMLNS =
	memo_codec:choose_top_xmlns(<<"jabber:memo:group:relation">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_group_item_attr_gcreater(Gcreater,
					     encode_group_item_attr_photo(Photo,
									  encode_group_item_attr_role(Role,
												      encode_group_item_attr_maxuser(Maxuser,
																     encode_group_item_attr_group_type(Group_type,
																				       encode_group_item_attr_gname(Gname,
																								    encode_group_item_attr_gid(Gid,
																											       memo_codec:enc_xmlns_attrs(__NewTopXMLNS,
																															  __TopXMLNS)))))))),
    {xmlel, <<"group_item">>, _attrs, _els}.

decode_group_item_attr_gid(__TopXMLNS, undefined) ->
    <<>>;
decode_group_item_attr_gid(__TopXMLNS, _val) -> _val.

encode_group_item_attr_gid(<<>>, _acc) -> _acc;
encode_group_item_attr_gid(_val, _acc) ->
    [{<<"gid">>, _val} | _acc].

decode_group_item_attr_gname(__TopXMLNS, undefined) ->
    <<>>;
decode_group_item_attr_gname(__TopXMLNS, _val) -> _val.

encode_group_item_attr_gname(<<>>, _acc) -> _acc;
encode_group_item_attr_gname(_val, _acc) ->
    [{<<"gname">>, _val} | _acc].

decode_group_item_attr_group_type(__TopXMLNS,
				  undefined) ->
    <<>>;
decode_group_item_attr_group_type(__TopXMLNS, _val) ->
    _val.

encode_group_item_attr_group_type(<<>>, _acc) -> _acc;
encode_group_item_attr_group_type(_val, _acc) ->
    [{<<"group_type">>, _val} | _acc].

decode_group_item_attr_maxuser(__TopXMLNS, undefined) ->
    <<>>;
decode_group_item_attr_maxuser(__TopXMLNS, _val) ->
    _val.

encode_group_item_attr_maxuser(<<>>, _acc) -> _acc;
encode_group_item_attr_maxuser(_val, _acc) ->
    [{<<"maxuser">>, _val} | _acc].

decode_group_item_attr_role(__TopXMLNS, undefined) ->
    <<>>;
decode_group_item_attr_role(__TopXMLNS, _val) -> _val.

encode_group_item_attr_role(<<>>, _acc) -> _acc;
encode_group_item_attr_role(_val, _acc) ->
    [{<<"role">>, _val} | _acc].

decode_group_item_attr_photo(__TopXMLNS, undefined) ->
    <<>>;
decode_group_item_attr_photo(__TopXMLNS, _val) -> _val.

encode_group_item_attr_photo(<<>>, _acc) -> _acc;
encode_group_item_attr_photo(_val, _acc) ->
    [{<<"photo">>, _val} | _acc].

decode_group_item_attr_gcreater(__TopXMLNS,
				undefined) ->
    undefined;
decode_group_item_attr_gcreater(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({memo_codec,
			{bad_attr_value, <<"gcreater">>, <<"group_item">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_group_item_attr_gcreater(undefined, _acc) ->
    _acc;
encode_group_item_attr_gcreater(_val, _acc) ->
    [{<<"gcreater">>, jid:encode(_val)} | _acc].
