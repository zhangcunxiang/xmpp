%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(memo_group_vcard).

-compile(export_all).

do_decode(<<"vCard">>, <<"group-vcard-temp">>, El,
	  Opts) ->
    decode_memo_group_vcard(<<"group-vcard-temp">>, Opts,
			    El);
do_decode(<<"URL">>, <<"group-vcard-temp">>, El,
	  Opts) ->
    decode_group_vcard_PHOTO_URL(<<"group-vcard-temp">>,
				 Opts, El);
do_decode(<<"PHOTO">>, <<"group-vcard-temp">>, El,
	  Opts) ->
    decode_group_vcard_PHOTO(<<"group-vcard-temp">>, Opts,
			     El);
do_decode(<<"TYPE">>, <<"group-vcard-temp">>, El,
	  Opts) ->
    decode_group_vcard_TYPE(<<"group-vcard-temp">>, Opts,
			    El);
do_decode(<<"GROUP_NAME">>, <<"group-vcard-temp">>, El,
	  Opts) ->
    decode_group_vcard_GROUP_NAME(<<"group-vcard-temp">>,
				  Opts, El);
do_decode(<<"BINVAL">>, <<"group-vcard-temp">>, El,
	  Opts) ->
    decode_group_vcard_BINVAL(<<"group-vcard-temp">>, Opts,
			      El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"vCard">>, <<"group-vcard-temp">>},
     {<<"URL">>, <<"group-vcard-temp">>},
     {<<"PHOTO">>, <<"group-vcard-temp">>},
     {<<"TYPE">>, <<"group-vcard-temp">>},
     {<<"GROUP_NAME">>, <<"group-vcard-temp">>},
     {<<"BINVAL">>, <<"group-vcard-temp">>}].

do_encode({group_vcard_photo, _, _} = Photo,
	  TopXMLNS) ->
    encode_group_vcard_PHOTO(Photo, TopXMLNS);
do_encode({memo_group_vcard, _, _, _, _, _} = Vcard,
	  TopXMLNS) ->
    encode_memo_group_vcard(Vcard, TopXMLNS).

do_get_name({group_vcard_photo, _, _}) -> <<"PHOTO">>;
do_get_name({memo_group_vcard, _, _, _, _, _}) ->
    <<"vCard">>.

do_get_ns({group_vcard_photo, _, _}) ->
    <<"group-vcard-temp">>;
do_get_ns({memo_group_vcard, _, _, _, _, _}) ->
    <<"group-vcard-temp">>.

pp(group_vcard_photo, 2) -> [type, photo];
pp(memo_group_vcard, 5) ->
    [gid, photo_version, group_name, photo, photo_url];
pp(_, _) -> no.

records() ->
    [{group_vcard_photo, 2}, {memo_group_vcard, 5}].

decode_memo_group_vcard(__TopXMLNS, __Opts,
			{xmlel, <<"vCard">>, _attrs, _els}) ->
    {Group_name, Photo_url, Photo} =
	decode_memo_group_vcard_els(__TopXMLNS, __Opts, _els,
				    undefined, undefined, undefined),
    {Gid, Photo_version} =
	decode_memo_group_vcard_attrs(__TopXMLNS, _attrs,
				      undefined, undefined),
    {memo_group_vcard, Gid, Photo_version, Group_name,
     Photo, Photo_url}.

decode_memo_group_vcard_els(__TopXMLNS, __Opts, [],
			    Group_name, Photo_url, Photo) ->
    {Group_name, Photo_url, Photo};
decode_memo_group_vcard_els(__TopXMLNS, __Opts,
			    [{xmlel, <<"GROUP_NAME">>, _attrs, _} = _el | _els],
			    Group_name, Photo_url, Photo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"group-vcard-temp">> ->
	  decode_memo_group_vcard_els(__TopXMLNS, __Opts, _els,
				      decode_group_vcard_GROUP_NAME(<<"group-vcard-temp">>,
								    __Opts,
								    _el),
				      Photo_url, Photo);
      _ ->
	  decode_memo_group_vcard_els(__TopXMLNS, __Opts, _els,
				      Group_name, Photo_url, Photo)
    end;
decode_memo_group_vcard_els(__TopXMLNS, __Opts,
			    [{xmlel, <<"PHOTO">>, _attrs, _} = _el | _els],
			    Group_name, Photo_url, Photo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"group-vcard-temp">> ->
	  decode_memo_group_vcard_els(__TopXMLNS, __Opts, _els,
				      Group_name, Photo_url,
				      decode_group_vcard_PHOTO(<<"group-vcard-temp">>,
							       __Opts, _el));
      _ ->
	  decode_memo_group_vcard_els(__TopXMLNS, __Opts, _els,
				      Group_name, Photo_url, Photo)
    end;
decode_memo_group_vcard_els(__TopXMLNS, __Opts,
			    [{xmlel, <<"URL">>, _attrs, _} = _el | _els],
			    Group_name, Photo_url, Photo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"group-vcard-temp">> ->
	  decode_memo_group_vcard_els(__TopXMLNS, __Opts, _els,
				      Group_name,
				      decode_group_vcard_PHOTO_URL(<<"group-vcard-temp">>,
								   __Opts, _el),
				      Photo);
      _ ->
	  decode_memo_group_vcard_els(__TopXMLNS, __Opts, _els,
				      Group_name, Photo_url, Photo)
    end;
decode_memo_group_vcard_els(__TopXMLNS, __Opts,
			    [_ | _els], Group_name, Photo_url, Photo) ->
    decode_memo_group_vcard_els(__TopXMLNS, __Opts, _els,
				Group_name, Photo_url, Photo).

decode_memo_group_vcard_attrs(__TopXMLNS,
			      [{<<"gid">>, _val} | _attrs], _Gid,
			      Photo_version) ->
    decode_memo_group_vcard_attrs(__TopXMLNS, _attrs, _val,
				  Photo_version);
decode_memo_group_vcard_attrs(__TopXMLNS,
			      [{<<"photo_version">>, _val} | _attrs], Gid,
			      _Photo_version) ->
    decode_memo_group_vcard_attrs(__TopXMLNS, _attrs, Gid,
				  _val);
decode_memo_group_vcard_attrs(__TopXMLNS, [_ | _attrs],
			      Gid, Photo_version) ->
    decode_memo_group_vcard_attrs(__TopXMLNS, _attrs, Gid,
				  Photo_version);
decode_memo_group_vcard_attrs(__TopXMLNS, [], Gid,
			      Photo_version) ->
    {decode_memo_group_vcard_attr_gid(__TopXMLNS, Gid),
     decode_memo_group_vcard_attr_photo_version(__TopXMLNS,
						Photo_version)}.

encode_memo_group_vcard({memo_group_vcard, Gid,
			 Photo_version, Group_name, Photo, Photo_url},
			__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"group-vcard-temp">>, [],
				    __TopXMLNS),
    _els =
	lists:reverse('encode_memo_group_vcard_$group_name'(Group_name,
							    __NewTopXMLNS,
							    'encode_memo_group_vcard_$photo_url'(Photo_url,
												 __NewTopXMLNS,
												 'encode_memo_group_vcard_$photo'(Photo,
																  __NewTopXMLNS,
																  [])))),
    _attrs =
	encode_memo_group_vcard_attr_photo_version(Photo_version,
						   encode_memo_group_vcard_attr_gid(Gid,
										    xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
													       __TopXMLNS))),
    {xmlel, <<"vCard">>, _attrs, _els}.

'encode_memo_group_vcard_$group_name'(undefined,
				      __TopXMLNS, _acc) ->
    _acc;
'encode_memo_group_vcard_$group_name'(Group_name,
				      __TopXMLNS, _acc) ->
    [encode_group_vcard_GROUP_NAME(Group_name, __TopXMLNS)
     | _acc].

'encode_memo_group_vcard_$photo_url'(undefined,
				     __TopXMLNS, _acc) ->
    _acc;
'encode_memo_group_vcard_$photo_url'(Photo_url,
				     __TopXMLNS, _acc) ->
    [encode_group_vcard_PHOTO_URL(Photo_url, __TopXMLNS)
     | _acc].

'encode_memo_group_vcard_$photo'(undefined, __TopXMLNS,
				 _acc) ->
    _acc;
'encode_memo_group_vcard_$photo'(Photo, __TopXMLNS,
				 _acc) ->
    [encode_group_vcard_PHOTO(Photo, __TopXMLNS) | _acc].

decode_memo_group_vcard_attr_gid(__TopXMLNS,
				 undefined) ->
    <<>>;
decode_memo_group_vcard_attr_gid(__TopXMLNS, _val) ->
    _val.

encode_memo_group_vcard_attr_gid(<<>>, _acc) -> _acc;
encode_memo_group_vcard_attr_gid(_val, _acc) ->
    [{<<"gid">>, _val} | _acc].

decode_memo_group_vcard_attr_photo_version(__TopXMLNS,
					   undefined) ->
    <<>>;
decode_memo_group_vcard_attr_photo_version(__TopXMLNS,
					   _val) ->
    _val.

encode_memo_group_vcard_attr_photo_version(<<>>,
					   _acc) ->
    _acc;
encode_memo_group_vcard_attr_photo_version(_val,
					   _acc) ->
    [{<<"photo_version">>, _val} | _acc].

decode_group_vcard_PHOTO_URL(__TopXMLNS, __Opts,
			     {xmlel, <<"URL">>, _attrs, _els}) ->
    Cdata = decode_group_vcard_PHOTO_URL_els(__TopXMLNS,
					     __Opts, _els, <<>>),
    Cdata.

decode_group_vcard_PHOTO_URL_els(__TopXMLNS, __Opts, [],
				 Cdata) ->
    decode_group_vcard_PHOTO_URL_cdata(__TopXMLNS, Cdata);
decode_group_vcard_PHOTO_URL_els(__TopXMLNS, __Opts,
				 [{xmlcdata, _data} | _els], Cdata) ->
    decode_group_vcard_PHOTO_URL_els(__TopXMLNS, __Opts,
				     _els, <<Cdata/binary, _data/binary>>);
decode_group_vcard_PHOTO_URL_els(__TopXMLNS, __Opts,
				 [_ | _els], Cdata) ->
    decode_group_vcard_PHOTO_URL_els(__TopXMLNS, __Opts,
				     _els, Cdata).

encode_group_vcard_PHOTO_URL(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"group-vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_group_vcard_PHOTO_URL_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"URL">>, _attrs, _els}.

decode_group_vcard_PHOTO_URL_cdata(__TopXMLNS, <<>>) ->
    <<>>;
decode_group_vcard_PHOTO_URL_cdata(__TopXMLNS, _val) ->
    _val.

encode_group_vcard_PHOTO_URL_cdata(<<>>, _acc) -> _acc;
encode_group_vcard_PHOTO_URL_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_group_vcard_PHOTO(__TopXMLNS, __Opts,
			 {xmlel, <<"PHOTO">>, _attrs, _els}) ->
    {Type, Photo} = decode_group_vcard_PHOTO_els(__TopXMLNS,
						 __Opts, _els, undefined,
						 undefined),
    {group_vcard_photo, Type, Photo}.

decode_group_vcard_PHOTO_els(__TopXMLNS, __Opts, [],
			     Type, Photo) ->
    {Type, Photo};
decode_group_vcard_PHOTO_els(__TopXMLNS, __Opts,
			     [{xmlel, <<"BINVAL">>, _attrs, _} = _el | _els],
			     Type, Photo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"group-vcard-temp">> ->
	  decode_group_vcard_PHOTO_els(__TopXMLNS, __Opts, _els,
				       Type,
				       decode_group_vcard_BINVAL(<<"group-vcard-temp">>,
								 __Opts, _el));
      _ ->
	  decode_group_vcard_PHOTO_els(__TopXMLNS, __Opts, _els,
				       Type, Photo)
    end;
decode_group_vcard_PHOTO_els(__TopXMLNS, __Opts,
			     [{xmlel, <<"TYPE">>, _attrs, _} = _el | _els],
			     Type, Photo) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"group-vcard-temp">> ->
	  decode_group_vcard_PHOTO_els(__TopXMLNS, __Opts, _els,
				       decode_group_vcard_TYPE(<<"group-vcard-temp">>,
							       __Opts, _el),
				       Photo);
      _ ->
	  decode_group_vcard_PHOTO_els(__TopXMLNS, __Opts, _els,
				       Type, Photo)
    end;
decode_group_vcard_PHOTO_els(__TopXMLNS, __Opts,
			     [_ | _els], Type, Photo) ->
    decode_group_vcard_PHOTO_els(__TopXMLNS, __Opts, _els,
				 Type, Photo).

encode_group_vcard_PHOTO({group_vcard_photo, Type,
			  Photo},
			 __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"group-vcard-temp">>, [],
				    __TopXMLNS),
    _els =
	lists:reverse('encode_group_vcard_PHOTO_$type'(Type,
						       __NewTopXMLNS,
						       'encode_group_vcard_PHOTO_$photo'(Photo,
											 __NewTopXMLNS,
											 []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"PHOTO">>, _attrs, _els}.

'encode_group_vcard_PHOTO_$type'(undefined, __TopXMLNS,
				 _acc) ->
    _acc;
'encode_group_vcard_PHOTO_$type'(Type, __TopXMLNS,
				 _acc) ->
    [encode_group_vcard_TYPE(Type, __TopXMLNS) | _acc].

'encode_group_vcard_PHOTO_$photo'(undefined, __TopXMLNS,
				  _acc) ->
    _acc;
'encode_group_vcard_PHOTO_$photo'(Photo, __TopXMLNS,
				  _acc) ->
    [encode_group_vcard_BINVAL(Photo, __TopXMLNS) | _acc].

decode_group_vcard_TYPE(__TopXMLNS, __Opts,
			{xmlel, <<"TYPE">>, _attrs, _els}) ->
    Cdata = decode_group_vcard_TYPE_els(__TopXMLNS, __Opts,
					_els, <<>>),
    Cdata.

decode_group_vcard_TYPE_els(__TopXMLNS, __Opts, [],
			    Cdata) ->
    decode_group_vcard_TYPE_cdata(__TopXMLNS, Cdata);
decode_group_vcard_TYPE_els(__TopXMLNS, __Opts,
			    [{xmlcdata, _data} | _els], Cdata) ->
    decode_group_vcard_TYPE_els(__TopXMLNS, __Opts, _els,
				<<Cdata/binary, _data/binary>>);
decode_group_vcard_TYPE_els(__TopXMLNS, __Opts,
			    [_ | _els], Cdata) ->
    decode_group_vcard_TYPE_els(__TopXMLNS, __Opts, _els,
				Cdata).

encode_group_vcard_TYPE(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"group-vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_group_vcard_TYPE_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"TYPE">>, _attrs, _els}.

decode_group_vcard_TYPE_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
		  {missing_cdata, <<>>, <<"TYPE">>, __TopXMLNS}});
decode_group_vcard_TYPE_cdata(__TopXMLNS, _val) -> _val.

encode_group_vcard_TYPE_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_group_vcard_GROUP_NAME(__TopXMLNS, __Opts,
			      {xmlel, <<"GROUP_NAME">>, _attrs, _els}) ->
    Cdata = decode_group_vcard_GROUP_NAME_els(__TopXMLNS,
					      __Opts, _els, <<>>),
    Cdata.

decode_group_vcard_GROUP_NAME_els(__TopXMLNS, __Opts,
				  [], Cdata) ->
    decode_group_vcard_GROUP_NAME_cdata(__TopXMLNS, Cdata);
decode_group_vcard_GROUP_NAME_els(__TopXMLNS, __Opts,
				  [{xmlcdata, _data} | _els], Cdata) ->
    decode_group_vcard_GROUP_NAME_els(__TopXMLNS, __Opts,
				      _els, <<Cdata/binary, _data/binary>>);
decode_group_vcard_GROUP_NAME_els(__TopXMLNS, __Opts,
				  [_ | _els], Cdata) ->
    decode_group_vcard_GROUP_NAME_els(__TopXMLNS, __Opts,
				      _els, Cdata).

encode_group_vcard_GROUP_NAME(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"group-vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_group_vcard_GROUP_NAME_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"GROUP_NAME">>, _attrs, _els}.

decode_group_vcard_GROUP_NAME_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
		  {missing_cdata, <<>>, <<"GROUP_NAME">>, __TopXMLNS}});
decode_group_vcard_GROUP_NAME_cdata(__TopXMLNS, _val) ->
    _val.

encode_group_vcard_GROUP_NAME_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].

decode_group_vcard_BINVAL(__TopXMLNS, __Opts,
			  {xmlel, <<"BINVAL">>, _attrs, _els}) ->
    Cdata = decode_group_vcard_BINVAL_els(__TopXMLNS,
					  __Opts, _els, <<>>),
    Cdata.

decode_group_vcard_BINVAL_els(__TopXMLNS, __Opts, [],
			      Cdata) ->
    decode_group_vcard_BINVAL_cdata(__TopXMLNS, Cdata);
decode_group_vcard_BINVAL_els(__TopXMLNS, __Opts,
			      [{xmlcdata, _data} | _els], Cdata) ->
    decode_group_vcard_BINVAL_els(__TopXMLNS, __Opts, _els,
				  <<Cdata/binary, _data/binary>>);
decode_group_vcard_BINVAL_els(__TopXMLNS, __Opts,
			      [_ | _els], Cdata) ->
    decode_group_vcard_BINVAL_els(__TopXMLNS, __Opts, _els,
				  Cdata).

encode_group_vcard_BINVAL(Cdata, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"group-vcard-temp">>, [],
				    __TopXMLNS),
    _els = encode_group_vcard_BINVAL_cdata(Cdata, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"BINVAL">>, _attrs, _els}.

decode_group_vcard_BINVAL_cdata(__TopXMLNS, <<>>) ->
    erlang:error({xmpp_codec,
		  {missing_cdata, <<>>, <<"BINVAL">>, __TopXMLNS}});
decode_group_vcard_BINVAL_cdata(__TopXMLNS, _val) ->
    _val.

encode_group_vcard_BINVAL_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].
