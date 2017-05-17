%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(memo_xep_topic).

-compile(export_all).

do_decode(<<"query">>, <<"jabber:iq:topic">>, El,
	  Opts) ->
    decode_mod_topic(<<"jabber:iq:topic">>, Opts, El);
do_decode(<<"topic_info">>, <<"memo:topic:info">>, El,
	  Opts) ->
    decode_topic_info(<<"memo:topic:info">>, Opts, El);
do_decode(<<"topic_user">>, <<"memo:topic:user">>, El,
	  Opts) ->
    decode_topic_user(<<"memo:topic:user">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"query">>, <<"jabber:iq:topic">>},
     {<<"topic_info">>, <<"memo:topic:info">>},
     {<<"topic_user">>, <<"memo:topic:user">>}].

do_encode({topic_user, _, _, _} = Topic_user,
	  TopXMLNS) ->
    encode_topic_user(Topic_user, TopXMLNS);
do_encode({topic_info, _, _, _, _, _, _} = Topic_info,
	  TopXMLNS) ->
    encode_topic_info(Topic_info, TopXMLNS);
do_encode({mod_topic, _, _, _} = Query, TopXMLNS) ->
    encode_mod_topic(Query, TopXMLNS).

do_get_name({mod_topic, _, _, _}) -> <<"query">>;
do_get_name({topic_info, _, _, _, _, _, _}) ->
    <<"topic_info">>;
do_get_name({topic_user, _, _, _}) -> <<"topic_user">>.

do_get_ns({mod_topic, _, _, _}) ->
    <<"jabber:iq:topic">>;
do_get_ns({topic_info, _, _, _, _, _, _}) ->
    <<"memo:topic:info">>;
do_get_ns({topic_user, _, _, _}) ->
    <<"memo:topic:user">>.

pp(topic_user, 3) -> [user, server, nick];
pp(topic_info, 6) ->
    [tid, tname, tcreater, tcreatetime, topic_type,
     user_item];
pp(mod_topic, 3) -> [rtype, code, topic_info];
pp(_, _) -> no.

records() ->
    [{topic_user, 3}, {topic_info, 6}, {mod_topic, 3}].

decode_mod_topic(__TopXMLNS, __Opts,
		 {xmlel, <<"query">>, _attrs, _els}) ->
    Topic_info = decode_mod_topic_els(__TopXMLNS, __Opts,
				      _els, []),
    {Rtype, Code} = decode_mod_topic_attrs(__TopXMLNS,
					   _attrs, undefined, undefined),
    {mod_topic, Rtype, Code, Topic_info}.

decode_mod_topic_els(__TopXMLNS, __Opts, [],
		     Topic_info) ->
    lists:reverse(Topic_info);
decode_mod_topic_els(__TopXMLNS, __Opts,
		     [{xmlel, <<"topic_info">>, _attrs, _} = _el | _els],
		     Topic_info) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"memo:topic:info">> ->
	  decode_mod_topic_els(__TopXMLNS, __Opts, _els,
			       [decode_topic_info(<<"memo:topic:info">>, __Opts,
						  _el)
				| Topic_info]);
      _ ->
	  decode_mod_topic_els(__TopXMLNS, __Opts, _els,
			       Topic_info)
    end;
decode_mod_topic_els(__TopXMLNS, __Opts, [_ | _els],
		     Topic_info) ->
    decode_mod_topic_els(__TopXMLNS, __Opts, _els,
			 Topic_info).

decode_mod_topic_attrs(__TopXMLNS,
		       [{<<"rtype">>, _val} | _attrs], _Rtype, Code) ->
    decode_mod_topic_attrs(__TopXMLNS, _attrs, _val, Code);
decode_mod_topic_attrs(__TopXMLNS,
		       [{<<"code">>, _val} | _attrs], Rtype, _Code) ->
    decode_mod_topic_attrs(__TopXMLNS, _attrs, Rtype, _val);
decode_mod_topic_attrs(__TopXMLNS, [_ | _attrs], Rtype,
		       Code) ->
    decode_mod_topic_attrs(__TopXMLNS, _attrs, Rtype, Code);
decode_mod_topic_attrs(__TopXMLNS, [], Rtype, Code) ->
    {decode_mod_topic_attr_rtype(__TopXMLNS, Rtype),
     decode_mod_topic_attr_code(__TopXMLNS, Code)}.

encode_mod_topic({mod_topic, Rtype, Code, Topic_info},
		 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:topic">>, [],
				    __TopXMLNS),
    _els =
	lists:reverse('encode_mod_topic_$topic_info'(Topic_info,
						     __NewTopXMLNS, [])),
    _attrs = encode_mod_topic_attr_code(Code,
					encode_mod_topic_attr_rtype(Rtype,
								    xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
											       __TopXMLNS))),
    {xmlel, <<"query">>, _attrs, _els}.

'encode_mod_topic_$topic_info'([], __TopXMLNS, _acc) ->
    _acc;
'encode_mod_topic_$topic_info'([Topic_info | _els],
			       __TopXMLNS, _acc) ->
    'encode_mod_topic_$topic_info'(_els, __TopXMLNS,
				   [encode_topic_info(Topic_info, __TopXMLNS)
				    | _acc]).

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

decode_topic_info(__TopXMLNS, __Opts,
		  {xmlel, <<"topic_info">>, _attrs, _els}) ->
    User_item = decode_topic_info_els(__TopXMLNS, __Opts,
				      _els, []),
    {Tid, Tname, Tcreater, Tcreatetime, Topic_type} =
	decode_topic_info_attrs(__TopXMLNS, _attrs, undefined,
				undefined, undefined, undefined, undefined),
    {topic_info, Tid, Tname, Tcreater, Tcreatetime,
     Topic_type, User_item}.

decode_topic_info_els(__TopXMLNS, __Opts, [],
		      User_item) ->
    lists:reverse(User_item);
decode_topic_info_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"topic_user">>, _attrs, _} = _el | _els],
		      User_item) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"memo:topic:user">> ->
	  decode_topic_info_els(__TopXMLNS, __Opts, _els,
				[decode_topic_user(<<"memo:topic:user">>,
						   __Opts, _el)
				 | User_item]);
      _ ->
	  decode_topic_info_els(__TopXMLNS, __Opts, _els,
				User_item)
    end;
decode_topic_info_els(__TopXMLNS, __Opts, [_ | _els],
		      User_item) ->
    decode_topic_info_els(__TopXMLNS, __Opts, _els,
			  User_item).

decode_topic_info_attrs(__TopXMLNS,
			[{<<"tid">>, _val} | _attrs], _Tid, Tname, Tcreater,
			Tcreatetime, Topic_type) ->
    decode_topic_info_attrs(__TopXMLNS, _attrs, _val, Tname,
			    Tcreater, Tcreatetime, Topic_type);
decode_topic_info_attrs(__TopXMLNS,
			[{<<"tname">>, _val} | _attrs], Tid, _Tname, Tcreater,
			Tcreatetime, Topic_type) ->
    decode_topic_info_attrs(__TopXMLNS, _attrs, Tid, _val,
			    Tcreater, Tcreatetime, Topic_type);
decode_topic_info_attrs(__TopXMLNS,
			[{<<"tcreater">>, _val} | _attrs], Tid, Tname,
			_Tcreater, Tcreatetime, Topic_type) ->
    decode_topic_info_attrs(__TopXMLNS, _attrs, Tid, Tname,
			    _val, Tcreatetime, Topic_type);
decode_topic_info_attrs(__TopXMLNS,
			[{<<"tcreatetime">>, _val} | _attrs], Tid, Tname,
			Tcreater, _Tcreatetime, Topic_type) ->
    decode_topic_info_attrs(__TopXMLNS, _attrs, Tid, Tname,
			    Tcreater, _val, Topic_type);
decode_topic_info_attrs(__TopXMLNS,
			[{<<"topic_type">>, _val} | _attrs], Tid, Tname,
			Tcreater, Tcreatetime, _Topic_type) ->
    decode_topic_info_attrs(__TopXMLNS, _attrs, Tid, Tname,
			    Tcreater, Tcreatetime, _val);
decode_topic_info_attrs(__TopXMLNS, [_ | _attrs], Tid,
			Tname, Tcreater, Tcreatetime, Topic_type) ->
    decode_topic_info_attrs(__TopXMLNS, _attrs, Tid, Tname,
			    Tcreater, Tcreatetime, Topic_type);
decode_topic_info_attrs(__TopXMLNS, [], Tid, Tname,
			Tcreater, Tcreatetime, Topic_type) ->
    {decode_topic_info_attr_tid(__TopXMLNS, Tid),
     decode_topic_info_attr_tname(__TopXMLNS, Tname),
     decode_topic_info_attr_tcreater(__TopXMLNS, Tcreater),
     decode_topic_info_attr_tcreatetime(__TopXMLNS,
					Tcreatetime),
     decode_topic_info_attr_topic_type(__TopXMLNS,
				       Topic_type)}.

encode_topic_info({topic_info, Tid, Tname, Tcreater,
		   Tcreatetime, Topic_type, User_item},
		  __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"memo:topic:info">>, [],
				    __TopXMLNS),
    _els =
	lists:reverse('encode_topic_info_$user_item'(User_item,
						     __NewTopXMLNS, [])),
    _attrs = encode_topic_info_attr_topic_type(Topic_type,
					       encode_topic_info_attr_tcreatetime(Tcreatetime,
										  encode_topic_info_attr_tcreater(Tcreater,
														  encode_topic_info_attr_tname(Tname,
																	       encode_topic_info_attr_tid(Tid,
																					  xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																								     __TopXMLNS)))))),
    {xmlel, <<"topic_info">>, _attrs, _els}.

'encode_topic_info_$user_item'([], __TopXMLNS, _acc) ->
    _acc;
'encode_topic_info_$user_item'([User_item | _els],
			       __TopXMLNS, _acc) ->
    'encode_topic_info_$user_item'(_els, __TopXMLNS,
				   [encode_topic_user(User_item, __TopXMLNS)
				    | _acc]).

decode_topic_info_attr_tid(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"tid">>, <<"topic_info">>,
		   __TopXMLNS}});
decode_topic_info_attr_tid(__TopXMLNS, _val) -> _val.

encode_topic_info_attr_tid(_val, _acc) ->
    [{<<"tid">>, _val} | _acc].

decode_topic_info_attr_tname(__TopXMLNS, undefined) ->
    <<>>;
decode_topic_info_attr_tname(__TopXMLNS, _val) -> _val.

encode_topic_info_attr_tname(<<>>, _acc) -> _acc;
encode_topic_info_attr_tname(_val, _acc) ->
    [{<<"tname">>, _val} | _acc].

decode_topic_info_attr_tcreater(__TopXMLNS,
				undefined) ->
    <<>>;
decode_topic_info_attr_tcreater(__TopXMLNS, _val) ->
    _val.

encode_topic_info_attr_tcreater(<<>>, _acc) -> _acc;
encode_topic_info_attr_tcreater(_val, _acc) ->
    [{<<"tcreater">>, _val} | _acc].

decode_topic_info_attr_tcreatetime(__TopXMLNS,
				   undefined) ->
    <<>>;
decode_topic_info_attr_tcreatetime(__TopXMLNS, _val) ->
    _val.

encode_topic_info_attr_tcreatetime(<<>>, _acc) -> _acc;
encode_topic_info_attr_tcreatetime(_val, _acc) ->
    [{<<"tcreatetime">>, _val} | _acc].

decode_topic_info_attr_topic_type(__TopXMLNS,
				  undefined) ->
    <<>>;
decode_topic_info_attr_topic_type(__TopXMLNS, _val) ->
    _val.

encode_topic_info_attr_topic_type(<<>>, _acc) -> _acc;
encode_topic_info_attr_topic_type(_val, _acc) ->
    [{<<"topic_type">>, _val} | _acc].

decode_topic_user(__TopXMLNS, __Opts,
		  {xmlel, <<"topic_user">>, _attrs, _els}) ->
    {User, Server, Nick} =
	decode_topic_user_attrs(__TopXMLNS, _attrs, undefined,
				undefined, undefined),
    {topic_user, User, Server, Nick}.

decode_topic_user_attrs(__TopXMLNS,
			[{<<"user">>, _val} | _attrs], _User, Server, Nick) ->
    decode_topic_user_attrs(__TopXMLNS, _attrs, _val,
			    Server, Nick);
decode_topic_user_attrs(__TopXMLNS,
			[{<<"server">>, _val} | _attrs], User, _Server, Nick) ->
    decode_topic_user_attrs(__TopXMLNS, _attrs, User, _val,
			    Nick);
decode_topic_user_attrs(__TopXMLNS,
			[{<<"nick">>, _val} | _attrs], User, Server, _Nick) ->
    decode_topic_user_attrs(__TopXMLNS, _attrs, User,
			    Server, _val);
decode_topic_user_attrs(__TopXMLNS, [_ | _attrs], User,
			Server, Nick) ->
    decode_topic_user_attrs(__TopXMLNS, _attrs, User,
			    Server, Nick);
decode_topic_user_attrs(__TopXMLNS, [], User, Server,
			Nick) ->
    {decode_topic_user_attr_user(__TopXMLNS, User),
     decode_topic_user_attr_server(__TopXMLNS, Server),
     decode_topic_user_attr_nick(__TopXMLNS, Nick)}.

encode_topic_user({topic_user, User, Server, Nick},
		  __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"memo:topic:user">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = encode_topic_user_attr_nick(Nick,
					 encode_topic_user_attr_server(Server,
								       encode_topic_user_attr_user(User,
												   xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
															      __TopXMLNS)))),
    {xmlel, <<"topic_user">>, _attrs, _els}.

decode_topic_user_attr_user(__TopXMLNS, undefined) ->
    <<>>;
decode_topic_user_attr_user(__TopXMLNS, _val) -> _val.

encode_topic_user_attr_user(<<>>, _acc) -> _acc;
encode_topic_user_attr_user(_val, _acc) ->
    [{<<"user">>, _val} | _acc].

decode_topic_user_attr_server(__TopXMLNS, undefined) ->
    <<>>;
decode_topic_user_attr_server(__TopXMLNS, _val) -> _val.

encode_topic_user_attr_server(<<>>, _acc) -> _acc;
encode_topic_user_attr_server(_val, _acc) ->
    [{<<"server">>, _val} | _acc].

decode_topic_user_attr_nick(__TopXMLNS, undefined) ->
    <<>>;
decode_topic_user_attr_nick(__TopXMLNS, _val) -> _val.

encode_topic_user_attr_nick(<<>>, _acc) -> _acc;
encode_topic_user_attr_nick(_val, _acc) ->
    [{<<"nick">>, _val} | _acc].
