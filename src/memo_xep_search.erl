%% Created automatically by XML generator (fxml_gen.erl)
%% Source: memo_codec.spec

-module(memo_xep_search).

-compile(export_all).

do_decode(<<"query">>, <<"jabber:memo:search">>, El,
	  Opts) ->
    decode_memo_search(<<"jabber:memo:search">>, Opts, El);
do_decode(<<"account">>, <<"jabber:memo:search">>, El,
	  Opts) ->
    decode_search_account(<<"jabber:memo:search">>, Opts,
			  El);
do_decode(<<"group_item">>, <<"jabber:memo:search">>,
	  El, Opts) ->
    decode_search_group_item(<<"jabber:memo:search">>, Opts,
			     El);
do_decode(<<"user_item">>, <<"jabber:memo:search">>, El,
	  Opts) ->
    decode_search_user_item(<<"jabber:memo:search">>, Opts,
			    El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({memo_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({memo_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"query">>, <<"jabber:memo:search">>},
     {<<"account">>, <<"jabber:memo:search">>},
     {<<"group_item">>, <<"jabber:memo:search">>},
     {<<"user_item">>, <<"jabber:memo:search">>}].

do_encode({search_user_item, _, _, _} = User_item,
	  TopXMLNS) ->
    encode_search_user_item(User_item, TopXMLNS);
do_encode({search_group_item, _, _, _, _} = Group_item,
	  TopXMLNS) ->
    encode_search_group_item(Group_item, TopXMLNS);
do_encode({memo_search, _, _, _, _, _} = Query,
	  TopXMLNS) ->
    encode_memo_search(Query, TopXMLNS).

do_get_name({memo_search, _, _, _, _, _}) ->
    <<"query">>;
do_get_name({search_group_item, _, _, _, _}) ->
    <<"group_item">>;
do_get_name({search_user_item, _, _, _}) ->
    <<"user_item">>.

do_get_ns({memo_search, _, _, _, _, _}) ->
    <<"jabber:memo:search">>;
do_get_ns({search_group_item, _, _, _, _}) ->
    <<"jabber:memo:search">>;
do_get_ns({search_user_item, _, _, _}) ->
    <<"jabber:memo:search">>.

pp(search_user_item, 3) -> [jid, nick, photo];
pp(search_group_item, 4) -> [gid, gname, gphoto, gtype];
pp(memo_search, 5) ->
    [rtype, keywords, user_items, group_items,
     search_account];
pp(_, _) -> no.

records() ->
    [{search_user_item, 3}, {search_group_item, 4},
     {memo_search, 5}].

decode_memo_search(__TopXMLNS, __Opts,
		   {xmlel, <<"query">>, _attrs, _els}) ->
    {Group_items, User_items, Search_account} =
	decode_memo_search_els(__TopXMLNS, __Opts, _els, [], [],
			       undefined),
    {Rtype, Keywords} = decode_memo_search_attrs(__TopXMLNS,
						 _attrs, undefined, undefined),
    {memo_search, Rtype, Keywords, User_items, Group_items,
     Search_account}.

decode_memo_search_els(__TopXMLNS, __Opts, [],
		       Group_items, User_items, Search_account) ->
    {lists:reverse(Group_items), lists:reverse(User_items),
     Search_account};
decode_memo_search_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"user_item">>, _attrs, _} = _el | _els],
		       Group_items, User_items, Search_account) ->
    case memo_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:memo:search">> ->
	  decode_memo_search_els(__TopXMLNS, __Opts, _els,
				 Group_items,
				 [decode_search_user_item(<<"jabber:memo:search">>,
							  __Opts, _el)
				  | User_items],
				 Search_account);
      _ ->
	  decode_memo_search_els(__TopXMLNS, __Opts, _els,
				 Group_items, User_items, Search_account)
    end;
decode_memo_search_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"group_item">>, _attrs, _} = _el | _els],
		       Group_items, User_items, Search_account) ->
    case memo_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:memo:search">> ->
	  decode_memo_search_els(__TopXMLNS, __Opts, _els,
				 [decode_search_group_item(<<"jabber:memo:search">>,
							   __Opts, _el)
				  | Group_items],
				 User_items, Search_account);
      _ ->
	  decode_memo_search_els(__TopXMLNS, __Opts, _els,
				 Group_items, User_items, Search_account)
    end;
decode_memo_search_els(__TopXMLNS, __Opts,
		       [{xmlel, <<"account">>, _attrs, _} = _el | _els],
		       Group_items, User_items, Search_account) ->
    case memo_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:memo:search">> ->
	  decode_memo_search_els(__TopXMLNS, __Opts, _els,
				 Group_items, User_items,
				 decode_search_account(<<"jabber:memo:search">>,
						       __Opts, _el));
      _ ->
	  decode_memo_search_els(__TopXMLNS, __Opts, _els,
				 Group_items, User_items, Search_account)
    end;
decode_memo_search_els(__TopXMLNS, __Opts, [_ | _els],
		       Group_items, User_items, Search_account) ->
    decode_memo_search_els(__TopXMLNS, __Opts, _els,
			   Group_items, User_items, Search_account).

decode_memo_search_attrs(__TopXMLNS,
			 [{<<"rtype">>, _val} | _attrs], _Rtype, Keywords) ->
    decode_memo_search_attrs(__TopXMLNS, _attrs, _val,
			     Keywords);
decode_memo_search_attrs(__TopXMLNS,
			 [{<<"keywords">>, _val} | _attrs], Rtype, _Keywords) ->
    decode_memo_search_attrs(__TopXMLNS, _attrs, Rtype,
			     _val);
decode_memo_search_attrs(__TopXMLNS, [_ | _attrs],
			 Rtype, Keywords) ->
    decode_memo_search_attrs(__TopXMLNS, _attrs, Rtype,
			     Keywords);
decode_memo_search_attrs(__TopXMLNS, [], Rtype,
			 Keywords) ->
    {decode_memo_search_attr_rtype(__TopXMLNS, Rtype),
     decode_memo_search_attr_keywords(__TopXMLNS, Keywords)}.

encode_memo_search({memo_search, Rtype, Keywords,
		    User_items, Group_items, Search_account},
		   __TopXMLNS) ->
    __NewTopXMLNS =
	memo_codec:choose_top_xmlns(<<"jabber:memo:search">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_memo_search_$group_items'(Group_items,
							__NewTopXMLNS,
							'encode_memo_search_$user_items'(User_items,
											 __NewTopXMLNS,
											 'encode_memo_search_$search_account'(Search_account,
															      __NewTopXMLNS,
															      [])))),
    _attrs = encode_memo_search_attr_keywords(Keywords,
					      encode_memo_search_attr_rtype(Rtype,
									    memo_codec:enc_xmlns_attrs(__NewTopXMLNS,
												       __TopXMLNS))),
    {xmlel, <<"query">>, _attrs, _els}.

'encode_memo_search_$group_items'([], __TopXMLNS,
				  _acc) ->
    _acc;
'encode_memo_search_$group_items'([Group_items | _els],
				  __TopXMLNS, _acc) ->
    'encode_memo_search_$group_items'(_els, __TopXMLNS,
				      [encode_search_group_item(Group_items,
								__TopXMLNS)
				       | _acc]).

'encode_memo_search_$user_items'([], __TopXMLNS,
				 _acc) ->
    _acc;
'encode_memo_search_$user_items'([User_items | _els],
				 __TopXMLNS, _acc) ->
    'encode_memo_search_$user_items'(_els, __TopXMLNS,
				     [encode_search_user_item(User_items,
							      __TopXMLNS)
				      | _acc]).

'encode_memo_search_$search_account'(undefined,
				     __TopXMLNS, _acc) ->
    _acc;
'encode_memo_search_$search_account'(Search_account,
				     __TopXMLNS, _acc) ->
    [encode_search_account(Search_account, __TopXMLNS)
     | _acc].

decode_memo_search_attr_rtype(__TopXMLNS, undefined) ->
    <<>>;
decode_memo_search_attr_rtype(__TopXMLNS, _val) -> _val.

encode_memo_search_attr_rtype(<<>>, _acc) -> _acc;
encode_memo_search_attr_rtype(_val, _acc) ->
    [{<<"rtype">>, _val} | _acc].

decode_memo_search_attr_keywords(__TopXMLNS,
				 undefined) ->
    <<>>;
decode_memo_search_attr_keywords(__TopXMLNS, _val) ->
    _val.

encode_memo_search_attr_keywords(<<>>, _acc) -> _acc;
encode_memo_search_attr_keywords(_val, _acc) ->
    [{<<"keywords">>, _val} | _acc].

decode_search_account(__TopXMLNS, __Opts,
		      {xmlel, <<"account">>, _attrs, _els}) ->
    Cdata = decode_search_account_els(__TopXMLNS, __Opts,
				      _els, <<>>),
    Cdata.

decode_search_account_els(__TopXMLNS, __Opts, [],
			  Cdata) ->
    decode_search_account_cdata(__TopXMLNS, Cdata);
decode_search_account_els(__TopXMLNS, __Opts,
			  [{xmlcdata, _data} | _els], Cdata) ->
    decode_search_account_els(__TopXMLNS, __Opts, _els,
			      <<Cdata/binary, _data/binary>>);
decode_search_account_els(__TopXMLNS, __Opts,
			  [_ | _els], Cdata) ->
    decode_search_account_els(__TopXMLNS, __Opts, _els,
			      Cdata).

encode_search_account(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	memo_codec:choose_top_xmlns(<<"jabber:memo:search">>,
				    [], __TopXMLNS),
    _els = encode_search_account_cdata(Cdata, []),
    _attrs = memo_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"account">>, _attrs, _els}.

decode_search_account_cdata(__TopXMLNS, <<>>) ->
    erlang:error({memo_codec,
		  {missing_cdata, <<>>, <<"account">>, __TopXMLNS}});
decode_search_account_cdata(__TopXMLNS, _val) -> _val.

encode_search_account_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_search_group_item(__TopXMLNS, __Opts,
			 {xmlel, <<"group_item">>, _attrs, _els}) ->
    {Gid, Gname, Gphoto, Gtype} =
	decode_search_group_item_attrs(__TopXMLNS, _attrs,
				       undefined, undefined, undefined,
				       undefined),
    {search_group_item, Gid, Gname, Gphoto, Gtype}.

decode_search_group_item_attrs(__TopXMLNS,
			       [{<<"gid">>, _val} | _attrs], _Gid, Gname,
			       Gphoto, Gtype) ->
    decode_search_group_item_attrs(__TopXMLNS, _attrs, _val,
				   Gname, Gphoto, Gtype);
decode_search_group_item_attrs(__TopXMLNS,
			       [{<<"gname">>, _val} | _attrs], Gid, _Gname,
			       Gphoto, Gtype) ->
    decode_search_group_item_attrs(__TopXMLNS, _attrs, Gid,
				   _val, Gphoto, Gtype);
decode_search_group_item_attrs(__TopXMLNS,
			       [{<<"gphoto">>, _val} | _attrs], Gid, Gname,
			       _Gphoto, Gtype) ->
    decode_search_group_item_attrs(__TopXMLNS, _attrs, Gid,
				   Gname, _val, Gtype);
decode_search_group_item_attrs(__TopXMLNS,
			       [{<<"gtype">>, _val} | _attrs], Gid, Gname,
			       Gphoto, _Gtype) ->
    decode_search_group_item_attrs(__TopXMLNS, _attrs, Gid,
				   Gname, Gphoto, _val);
decode_search_group_item_attrs(__TopXMLNS, [_ | _attrs],
			       Gid, Gname, Gphoto, Gtype) ->
    decode_search_group_item_attrs(__TopXMLNS, _attrs, Gid,
				   Gname, Gphoto, Gtype);
decode_search_group_item_attrs(__TopXMLNS, [], Gid,
			       Gname, Gphoto, Gtype) ->
    {decode_search_group_item_attr_gid(__TopXMLNS, Gid),
     decode_search_group_item_attr_gname(__TopXMLNS, Gname),
     decode_search_group_item_attr_gphoto(__TopXMLNS,
					  Gphoto),
     decode_search_group_item_attr_gtype(__TopXMLNS, Gtype)}.

encode_search_group_item({search_group_item, Gid, Gname,
			  Gphoto, Gtype},
			 __TopXMLNS) ->
    __NewTopXMLNS =
	memo_codec:choose_top_xmlns(<<"jabber:memo:search">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_search_group_item_attr_gtype(Gtype,
						 encode_search_group_item_attr_gphoto(Gphoto,
										      encode_search_group_item_attr_gname(Gname,
															  encode_search_group_item_attr_gid(Gid,
																			    memo_codec:enc_xmlns_attrs(__NewTopXMLNS,
																						       __TopXMLNS))))),
    {xmlel, <<"group_item">>, _attrs, _els}.

decode_search_group_item_attr_gid(__TopXMLNS,
				  undefined) ->
    <<>>;
decode_search_group_item_attr_gid(__TopXMLNS, _val) ->
    _val.

encode_search_group_item_attr_gid(<<>>, _acc) -> _acc;
encode_search_group_item_attr_gid(_val, _acc) ->
    [{<<"gid">>, _val} | _acc].

decode_search_group_item_attr_gname(__TopXMLNS,
				    undefined) ->
    <<>>;
decode_search_group_item_attr_gname(__TopXMLNS, _val) ->
    _val.

encode_search_group_item_attr_gname(<<>>, _acc) -> _acc;
encode_search_group_item_attr_gname(_val, _acc) ->
    [{<<"gname">>, _val} | _acc].

decode_search_group_item_attr_gphoto(__TopXMLNS,
				     undefined) ->
    <<>>;
decode_search_group_item_attr_gphoto(__TopXMLNS,
				     _val) ->
    _val.

encode_search_group_item_attr_gphoto(<<>>, _acc) ->
    _acc;
encode_search_group_item_attr_gphoto(_val, _acc) ->
    [{<<"gphoto">>, _val} | _acc].

decode_search_group_item_attr_gtype(__TopXMLNS,
				    undefined) ->
    <<>>;
decode_search_group_item_attr_gtype(__TopXMLNS, _val) ->
    _val.

encode_search_group_item_attr_gtype(<<>>, _acc) -> _acc;
encode_search_group_item_attr_gtype(_val, _acc) ->
    [{<<"gtype">>, _val} | _acc].

decode_search_user_item(__TopXMLNS, __Opts,
			{xmlel, <<"user_item">>, _attrs, _els}) ->
    {Jid, Nick, Photo} =
	decode_search_user_item_attrs(__TopXMLNS, _attrs,
				      undefined, undefined, undefined),
    {search_user_item, Jid, Nick, Photo}.

decode_search_user_item_attrs(__TopXMLNS,
			      [{<<"jid">>, _val} | _attrs], _Jid, Nick,
			      Photo) ->
    decode_search_user_item_attrs(__TopXMLNS, _attrs, _val,
				  Nick, Photo);
decode_search_user_item_attrs(__TopXMLNS,
			      [{<<"nick">>, _val} | _attrs], Jid, _Nick,
			      Photo) ->
    decode_search_user_item_attrs(__TopXMLNS, _attrs, Jid,
				  _val, Photo);
decode_search_user_item_attrs(__TopXMLNS,
			      [{<<"photo">>, _val} | _attrs], Jid, Nick,
			      _Photo) ->
    decode_search_user_item_attrs(__TopXMLNS, _attrs, Jid,
				  Nick, _val);
decode_search_user_item_attrs(__TopXMLNS, [_ | _attrs],
			      Jid, Nick, Photo) ->
    decode_search_user_item_attrs(__TopXMLNS, _attrs, Jid,
				  Nick, Photo);
decode_search_user_item_attrs(__TopXMLNS, [], Jid, Nick,
			      Photo) ->
    {decode_search_user_item_attr_jid(__TopXMLNS, Jid),
     decode_search_user_item_attr_nick(__TopXMLNS, Nick),
     decode_search_user_item_attr_photo(__TopXMLNS, Photo)}.

encode_search_user_item({search_user_item, Jid, Nick,
			 Photo},
			__TopXMLNS) ->
    __NewTopXMLNS =
	memo_codec:choose_top_xmlns(<<"jabber:memo:search">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_search_user_item_attr_photo(Photo,
						encode_search_user_item_attr_nick(Nick,
										  encode_search_user_item_attr_jid(Jid,
														   memo_codec:enc_xmlns_attrs(__NewTopXMLNS,
																	      __TopXMLNS)))),
    {xmlel, <<"user_item">>, _attrs, _els}.

decode_search_user_item_attr_jid(__TopXMLNS,
				 undefined) ->
    undefined;
decode_search_user_item_attr_jid(__TopXMLNS, _val) ->
    case catch jid:decode(_val) of
      {'EXIT', _} ->
	  erlang:error({memo_codec,
			{bad_attr_value, <<"jid">>, <<"user_item">>,
			 __TopXMLNS}});
      _res -> _res
    end.

encode_search_user_item_attr_jid(undefined, _acc) ->
    _acc;
encode_search_user_item_attr_jid(_val, _acc) ->
    [{<<"jid">>, jid:encode(_val)} | _acc].

decode_search_user_item_attr_nick(__TopXMLNS,
				  undefined) ->
    <<>>;
decode_search_user_item_attr_nick(__TopXMLNS, _val) ->
    _val.

encode_search_user_item_attr_nick(<<>>, _acc) -> _acc;
encode_search_user_item_attr_nick(_val, _acc) ->
    [{<<"nick">>, _val} | _acc].

decode_search_user_item_attr_photo(__TopXMLNS,
				   undefined) ->
    <<>>;
decode_search_user_item_attr_photo(__TopXMLNS, _val) ->
    _val.

encode_search_user_item_attr_photo(<<>>, _acc) -> _acc;
encode_search_user_item_attr_photo(_val, _acc) ->
    [{<<"photo">>, _val} | _acc].
