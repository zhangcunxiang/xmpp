%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(memo_xep_scene).

-compile(export_all).

do_decode(<<"query">>, <<"jabber:memo:scene">>, El,
	  Opts) ->
    decode_memo_scene(<<"jabber:memo:scene">>, Opts, El);
do_decode(<<"profile">>, <<"jabber:memo:scene">>, El,
	  Opts) ->
    decode_material_profile(<<"jabber:memo:scene">>, Opts,
			    El);
do_decode(<<"trans_form">>, <<"jabber:memo:scene">>, El,
	  Opts) ->
    decode_trans_form(<<"jabber:memo:scene">>, Opts, El);
do_decode(<<"size">>, <<"jabber:memo:scene">>, El,
	  Opts) ->
    decode_size(<<"jabber:memo:scene">>, Opts, El);
do_decode(<<"position">>, <<"jabber:memo:scene">>, El,
	  Opts) ->
    decode_position(<<"jabber:memo:scene">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"query">>, <<"jabber:memo:scene">>},
     {<<"profile">>, <<"jabber:memo:scene">>},
     {<<"trans_form">>, <<"jabber:memo:scene">>},
     {<<"size">>, <<"jabber:memo:scene">>},
     {<<"position">>, <<"jabber:memo:scene">>}].

do_encode({position, _, _, _} = Position, TopXMLNS) ->
    encode_position(Position, TopXMLNS);
do_encode({size, _, _, _} = Size, TopXMLNS) ->
    encode_size(Size, TopXMLNS);
do_encode({trans_form, _, _} = Trans_form, TopXMLNS) ->
    encode_trans_form(Trans_form, TopXMLNS);
do_encode({profile, _, _, _, _, _, _} = Profile,
	  TopXMLNS) ->
    encode_material_profile(Profile, TopXMLNS);
do_encode({memo_scene, _, _, _, _, _, _, _, _, _, _,
	   _} =
	      Query,
	  TopXMLNS) ->
    encode_memo_scene(Query, TopXMLNS).

do_get_name({memo_scene, _, _, _, _, _, _, _, _, _, _,
	     _}) ->
    <<"query">>;
do_get_name({position, _, _, _}) -> <<"position">>;
do_get_name({profile, _, _, _, _, _, _}) ->
    <<"profile">>;
do_get_name({size, _, _, _}) -> <<"size">>;
do_get_name({trans_form, _, _}) -> <<"trans_form">>.

do_get_ns({memo_scene, _, _, _, _, _, _, _, _, _, _,
	   _}) ->
    <<"jabber:memo:scene">>;
do_get_ns({position, _, _, _}) ->
    <<"jabber:memo:scene">>;
do_get_ns({profile, _, _, _, _, _, _}) ->
    <<"jabber:memo:scene">>;
do_get_ns({size, _, _, _}) -> <<"jabber:memo:scene">>;
do_get_ns({trans_form, _, _}) ->
    <<"jabber:memo:scene">>.

pp(position, 3) -> [x, y, z];
pp(size, 3) -> [l, w, h];
pp(trans_form, 2) -> [position, size];
pp(profile, 6) ->
    [trans_form, mac_address, type, name, scene_id,
     message];
pp(memo_scene, 11) ->
    [profiles, name, rtype, role, type, height, width,
     length, scene_id, share_user, creator];
pp(_, _) -> no.

records() ->
    [{position, 3}, {size, 3}, {trans_form, 2},
     {profile, 6}, {memo_scene, 11}].

decode_memo_scene(__TopXMLNS, __Opts,
		  {xmlel, <<"query">>, _attrs, _els}) ->
    Profiles = decode_memo_scene_els(__TopXMLNS, __Opts,
				     _els, []),
    {Name, Rtype, Type, Role, Height, Width, Length,
     Share_user, Creator, Scene_id} =
	decode_memo_scene_attrs(__TopXMLNS, _attrs, undefined,
				undefined, undefined, undefined, undefined,
				undefined, undefined, undefined, undefined,
				undefined),
    {memo_scene, Profiles, Name, Rtype, Role, Type, Height,
     Width, Length, Scene_id, Share_user, Creator}.

decode_memo_scene_els(__TopXMLNS, __Opts, [],
		      Profiles) ->
    lists:reverse(Profiles);
decode_memo_scene_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"profile">>, _attrs, _} = _el | _els],
		      Profiles) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:memo:scene">> ->
	  decode_memo_scene_els(__TopXMLNS, __Opts, _els,
				[decode_material_profile(<<"jabber:memo:scene">>,
							 __Opts, _el)
				 | Profiles]);
      _ ->
	  decode_memo_scene_els(__TopXMLNS, __Opts, _els,
				Profiles)
    end;
decode_memo_scene_els(__TopXMLNS, __Opts, [_ | _els],
		      Profiles) ->
    decode_memo_scene_els(__TopXMLNS, __Opts, _els,
			  Profiles).

decode_memo_scene_attrs(__TopXMLNS,
			[{<<"name">>, _val} | _attrs], _Name, Rtype, Type, Role,
			Height, Width, Length, Share_user, Creator, Scene_id) ->
    decode_memo_scene_attrs(__TopXMLNS, _attrs, _val, Rtype,
			    Type, Role, Height, Width, Length, Share_user,
			    Creator, Scene_id);
decode_memo_scene_attrs(__TopXMLNS,
			[{<<"rtype">>, _val} | _attrs], Name, _Rtype, Type,
			Role, Height, Width, Length, Share_user, Creator,
			Scene_id) ->
    decode_memo_scene_attrs(__TopXMLNS, _attrs, Name, _val,
			    Type, Role, Height, Width, Length, Share_user,
			    Creator, Scene_id);
decode_memo_scene_attrs(__TopXMLNS,
			[{<<"type">>, _val} | _attrs], Name, Rtype, _Type, Role,
			Height, Width, Length, Share_user, Creator, Scene_id) ->
    decode_memo_scene_attrs(__TopXMLNS, _attrs, Name, Rtype,
			    _val, Role, Height, Width, Length, Share_user,
			    Creator, Scene_id);
decode_memo_scene_attrs(__TopXMLNS,
			[{<<"role">>, _val} | _attrs], Name, Rtype, Type, _Role,
			Height, Width, Length, Share_user, Creator, Scene_id) ->
    decode_memo_scene_attrs(__TopXMLNS, _attrs, Name, Rtype,
			    Type, _val, Height, Width, Length, Share_user,
			    Creator, Scene_id);
decode_memo_scene_attrs(__TopXMLNS,
			[{<<"height">>, _val} | _attrs], Name, Rtype, Type,
			Role, _Height, Width, Length, Share_user, Creator,
			Scene_id) ->
    decode_memo_scene_attrs(__TopXMLNS, _attrs, Name, Rtype,
			    Type, Role, _val, Width, Length, Share_user,
			    Creator, Scene_id);
decode_memo_scene_attrs(__TopXMLNS,
			[{<<"width">>, _val} | _attrs], Name, Rtype, Type, Role,
			Height, _Width, Length, Share_user, Creator,
			Scene_id) ->
    decode_memo_scene_attrs(__TopXMLNS, _attrs, Name, Rtype,
			    Type, Role, Height, _val, Length, Share_user,
			    Creator, Scene_id);
decode_memo_scene_attrs(__TopXMLNS,
			[{<<"length">>, _val} | _attrs], Name, Rtype, Type,
			Role, Height, Width, _Length, Share_user, Creator,
			Scene_id) ->
    decode_memo_scene_attrs(__TopXMLNS, _attrs, Name, Rtype,
			    Type, Role, Height, Width, _val, Share_user,
			    Creator, Scene_id);
decode_memo_scene_attrs(__TopXMLNS,
			[{<<"share_user">>, _val} | _attrs], Name, Rtype, Type,
			Role, Height, Width, Length, _Share_user, Creator,
			Scene_id) ->
    decode_memo_scene_attrs(__TopXMLNS, _attrs, Name, Rtype,
			    Type, Role, Height, Width, Length, _val, Creator,
			    Scene_id);
decode_memo_scene_attrs(__TopXMLNS,
			[{<<"creator">>, _val} | _attrs], Name, Rtype, Type,
			Role, Height, Width, Length, Share_user, _Creator,
			Scene_id) ->
    decode_memo_scene_attrs(__TopXMLNS, _attrs, Name, Rtype,
			    Type, Role, Height, Width, Length, Share_user, _val,
			    Scene_id);
decode_memo_scene_attrs(__TopXMLNS,
			[{<<"scene_id">>, _val} | _attrs], Name, Rtype, Type,
			Role, Height, Width, Length, Share_user, Creator,
			_Scene_id) ->
    decode_memo_scene_attrs(__TopXMLNS, _attrs, Name, Rtype,
			    Type, Role, Height, Width, Length, Share_user,
			    Creator, _val);
decode_memo_scene_attrs(__TopXMLNS, [_ | _attrs], Name,
			Rtype, Type, Role, Height, Width, Length, Share_user,
			Creator, Scene_id) ->
    decode_memo_scene_attrs(__TopXMLNS, _attrs, Name, Rtype,
			    Type, Role, Height, Width, Length, Share_user,
			    Creator, Scene_id);
decode_memo_scene_attrs(__TopXMLNS, [], Name, Rtype,
			Type, Role, Height, Width, Length, Share_user, Creator,
			Scene_id) ->
    {decode_memo_scene_attr_name(__TopXMLNS, Name),
     decode_memo_scene_attr_rtype(__TopXMLNS, Rtype),
     decode_memo_scene_attr_type(__TopXMLNS, Type),
     decode_memo_scene_attr_role(__TopXMLNS, Role),
     decode_memo_scene_attr_height(__TopXMLNS, Height),
     decode_memo_scene_attr_width(__TopXMLNS, Width),
     decode_memo_scene_attr_length(__TopXMLNS, Length),
     decode_memo_scene_attr_share_user(__TopXMLNS,
				       Share_user),
     decode_memo_scene_attr_creator(__TopXMLNS, Creator),
     decode_memo_scene_attr_scene_id(__TopXMLNS, Scene_id)}.

encode_memo_scene({memo_scene, Profiles, Name, Rtype,
		   Role, Type, Height, Width, Length, Scene_id, Share_user,
		   Creator},
		  __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:memo:scene">>, [],
				    __TopXMLNS),
    _els =
	lists:reverse('encode_memo_scene_$profiles'(Profiles,
						    __NewTopXMLNS, [])),
    _attrs = encode_memo_scene_attr_scene_id(Scene_id,
					     encode_memo_scene_attr_creator(Creator,
									    encode_memo_scene_attr_share_user(Share_user,
													      encode_memo_scene_attr_length(Length,
																	    encode_memo_scene_attr_width(Width,
																					 encode_memo_scene_attr_height(Height,
																								       encode_memo_scene_attr_role(Role,
																												   encode_memo_scene_attr_type(Type,
																															       encode_memo_scene_attr_rtype(Rtype,
																																			    encode_memo_scene_attr_name(Name,
																																							xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																																										   __TopXMLNS))))))))))),
    {xmlel, <<"query">>, _attrs, _els}.

'encode_memo_scene_$profiles'([], __TopXMLNS, _acc) ->
    _acc;
'encode_memo_scene_$profiles'([Profiles | _els],
			      __TopXMLNS, _acc) ->
    'encode_memo_scene_$profiles'(_els, __TopXMLNS,
				  [encode_material_profile(Profiles, __TopXMLNS)
				   | _acc]).

decode_memo_scene_attr_name(__TopXMLNS, undefined) ->
    <<>>;
decode_memo_scene_attr_name(__TopXMLNS, _val) -> _val.

encode_memo_scene_attr_name(<<>>, _acc) -> _acc;
encode_memo_scene_attr_name(_val, _acc) ->
    [{<<"name">>, _val} | _acc].

decode_memo_scene_attr_rtype(__TopXMLNS, undefined) ->
    <<>>;
decode_memo_scene_attr_rtype(__TopXMLNS, _val) -> _val.

encode_memo_scene_attr_rtype(<<>>, _acc) -> _acc;
encode_memo_scene_attr_rtype(_val, _acc) ->
    [{<<"rtype">>, _val} | _acc].

decode_memo_scene_attr_type(__TopXMLNS, undefined) ->
    <<>>;
decode_memo_scene_attr_type(__TopXMLNS, _val) -> _val.

encode_memo_scene_attr_type(<<>>, _acc) -> _acc;
encode_memo_scene_attr_type(_val, _acc) ->
    [{<<"type">>, _val} | _acc].

decode_memo_scene_attr_role(__TopXMLNS, undefined) ->
    <<>>;
decode_memo_scene_attr_role(__TopXMLNS, _val) -> _val.

encode_memo_scene_attr_role(<<>>, _acc) -> _acc;
encode_memo_scene_attr_role(_val, _acc) ->
    [{<<"role">>, _val} | _acc].

decode_memo_scene_attr_height(__TopXMLNS, undefined) ->
    <<>>;
decode_memo_scene_attr_height(__TopXMLNS, _val) -> _val.

encode_memo_scene_attr_height(<<>>, _acc) -> _acc;
encode_memo_scene_attr_height(_val, _acc) ->
    [{<<"height">>, _val} | _acc].

decode_memo_scene_attr_width(__TopXMLNS, undefined) ->
    <<>>;
decode_memo_scene_attr_width(__TopXMLNS, _val) -> _val.

encode_memo_scene_attr_width(<<>>, _acc) -> _acc;
encode_memo_scene_attr_width(_val, _acc) ->
    [{<<"width">>, _val} | _acc].

decode_memo_scene_attr_length(__TopXMLNS, undefined) ->
    <<>>;
decode_memo_scene_attr_length(__TopXMLNS, _val) -> _val.

encode_memo_scene_attr_length(<<>>, _acc) -> _acc;
encode_memo_scene_attr_length(_val, _acc) ->
    [{<<"length">>, _val} | _acc].

decode_memo_scene_attr_share_user(__TopXMLNS,
				  undefined) ->
    <<>>;
decode_memo_scene_attr_share_user(__TopXMLNS, _val) ->
    _val.

encode_memo_scene_attr_share_user(<<>>, _acc) -> _acc;
encode_memo_scene_attr_share_user(_val, _acc) ->
    [{<<"share_user">>, _val} | _acc].

decode_memo_scene_attr_creator(__TopXMLNS, undefined) ->
    <<>>;
decode_memo_scene_attr_creator(__TopXMLNS, _val) ->
    _val.

encode_memo_scene_attr_creator(<<>>, _acc) -> _acc;
encode_memo_scene_attr_creator(_val, _acc) ->
    [{<<"creator">>, _val} | _acc].

decode_memo_scene_attr_scene_id(__TopXMLNS,
				undefined) ->
    <<>>;
decode_memo_scene_attr_scene_id(__TopXMLNS, _val) ->
    _val.

encode_memo_scene_attr_scene_id(<<>>, _acc) -> _acc;
encode_memo_scene_attr_scene_id(_val, _acc) ->
    [{<<"scene_id">>, _val} | _acc].

decode_material_profile(__TopXMLNS, __Opts,
			{xmlel, <<"profile">>, _attrs, _els}) ->
    Trans_form = decode_material_profile_els(__TopXMLNS,
					     __Opts, _els, undefined),
    {Mac_address, Type, Message, Scene_id, Name} =
	decode_material_profile_attrs(__TopXMLNS, _attrs,
				      undefined, undefined, undefined,
				      undefined, undefined),
    {profile, Trans_form, Mac_address, Type, Name, Scene_id,
     Message}.

decode_material_profile_els(__TopXMLNS, __Opts, [],
			    Trans_form) ->
    Trans_form;
decode_material_profile_els(__TopXMLNS, __Opts,
			    [{xmlel, <<"trans_form">>, _attrs, _} = _el | _els],
			    Trans_form) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:memo:scene">> ->
	  decode_material_profile_els(__TopXMLNS, __Opts, _els,
				      decode_trans_form(<<"jabber:memo:scene">>,
							__Opts, _el));
      _ ->
	  decode_material_profile_els(__TopXMLNS, __Opts, _els,
				      Trans_form)
    end;
decode_material_profile_els(__TopXMLNS, __Opts,
			    [_ | _els], Trans_form) ->
    decode_material_profile_els(__TopXMLNS, __Opts, _els,
				Trans_form).

decode_material_profile_attrs(__TopXMLNS,
			      [{<<"mac_address">>, _val} | _attrs],
			      _Mac_address, Type, Message, Scene_id, Name) ->
    decode_material_profile_attrs(__TopXMLNS, _attrs, _val,
				  Type, Message, Scene_id, Name);
decode_material_profile_attrs(__TopXMLNS,
			      [{<<"type">>, _val} | _attrs], Mac_address, _Type,
			      Message, Scene_id, Name) ->
    decode_material_profile_attrs(__TopXMLNS, _attrs,
				  Mac_address, _val, Message, Scene_id, Name);
decode_material_profile_attrs(__TopXMLNS,
			      [{<<"message">>, _val} | _attrs], Mac_address,
			      Type, _Message, Scene_id, Name) ->
    decode_material_profile_attrs(__TopXMLNS, _attrs,
				  Mac_address, Type, _val, Scene_id, Name);
decode_material_profile_attrs(__TopXMLNS,
			      [{<<"scene_id">>, _val} | _attrs], Mac_address,
			      Type, Message, _Scene_id, Name) ->
    decode_material_profile_attrs(__TopXMLNS, _attrs,
				  Mac_address, Type, Message, _val, Name);
decode_material_profile_attrs(__TopXMLNS,
			      [{<<"name">>, _val} | _attrs], Mac_address, Type,
			      Message, Scene_id, _Name) ->
    decode_material_profile_attrs(__TopXMLNS, _attrs,
				  Mac_address, Type, Message, Scene_id, _val);
decode_material_profile_attrs(__TopXMLNS, [_ | _attrs],
			      Mac_address, Type, Message, Scene_id, Name) ->
    decode_material_profile_attrs(__TopXMLNS, _attrs,
				  Mac_address, Type, Message, Scene_id, Name);
decode_material_profile_attrs(__TopXMLNS, [],
			      Mac_address, Type, Message, Scene_id, Name) ->
    {decode_material_profile_attr_mac_address(__TopXMLNS,
					      Mac_address),
     decode_material_profile_attr_type(__TopXMLNS, Type),
     decode_material_profile_attr_message(__TopXMLNS,
					  Message),
     decode_material_profile_attr_scene_id(__TopXMLNS,
					   Scene_id),
     decode_material_profile_attr_name(__TopXMLNS, Name)}.

encode_material_profile({profile, Trans_form,
			 Mac_address, Type, Name, Scene_id, Message},
			__TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:memo:scene">>, [],
				    __TopXMLNS),
    _els =
	lists:reverse('encode_material_profile_$trans_form'(Trans_form,
							    __NewTopXMLNS, [])),
    _attrs = encode_material_profile_attr_name(Name,
					       encode_material_profile_attr_scene_id(Scene_id,
										     encode_material_profile_attr_message(Message,
															  encode_material_profile_attr_type(Type,
																			    encode_material_profile_attr_mac_address(Mac_address,
																								     xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																												__TopXMLNS)))))),
    {xmlel, <<"profile">>, _attrs, _els}.

'encode_material_profile_$trans_form'(undefined,
				      __TopXMLNS, _acc) ->
    _acc;
'encode_material_profile_$trans_form'(Trans_form,
				      __TopXMLNS, _acc) ->
    [encode_trans_form(Trans_form, __TopXMLNS) | _acc].

decode_material_profile_attr_mac_address(__TopXMLNS,
					 undefined) ->
    <<>>;
decode_material_profile_attr_mac_address(__TopXMLNS,
					 _val) ->
    _val.

encode_material_profile_attr_mac_address(<<>>, _acc) ->
    _acc;
encode_material_profile_attr_mac_address(_val, _acc) ->
    [{<<"mac_address">>, _val} | _acc].

decode_material_profile_attr_type(__TopXMLNS,
				  undefined) ->
    <<>>;
decode_material_profile_attr_type(__TopXMLNS, _val) ->
    _val.

encode_material_profile_attr_type(<<>>, _acc) -> _acc;
encode_material_profile_attr_type(_val, _acc) ->
    [{<<"type">>, _val} | _acc].

decode_material_profile_attr_message(__TopXMLNS,
				     undefined) ->
    <<>>;
decode_material_profile_attr_message(__TopXMLNS,
				     _val) ->
    _val.

encode_material_profile_attr_message(<<>>, _acc) ->
    _acc;
encode_material_profile_attr_message(_val, _acc) ->
    [{<<"message">>, _val} | _acc].

decode_material_profile_attr_scene_id(__TopXMLNS,
				      undefined) ->
    <<>>;
decode_material_profile_attr_scene_id(__TopXMLNS,
				      _val) ->
    _val.

encode_material_profile_attr_scene_id(<<>>, _acc) ->
    _acc;
encode_material_profile_attr_scene_id(_val, _acc) ->
    [{<<"scene_id">>, _val} | _acc].

decode_material_profile_attr_name(__TopXMLNS,
				  undefined) ->
    <<>>;
decode_material_profile_attr_name(__TopXMLNS, _val) ->
    _val.

encode_material_profile_attr_name(<<>>, _acc) -> _acc;
encode_material_profile_attr_name(_val, _acc) ->
    [{<<"name">>, _val} | _acc].

decode_trans_form(__TopXMLNS, __Opts,
		  {xmlel, <<"trans_form">>, _attrs, _els}) ->
    {Size, Position} = decode_trans_form_els(__TopXMLNS,
					     __Opts, _els, undefined,
					     undefined),
    {trans_form, Position, Size}.

decode_trans_form_els(__TopXMLNS, __Opts, [], Size,
		      Position) ->
    {Size, Position};
decode_trans_form_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"position">>, _attrs, _} = _el | _els], Size,
		      Position) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:memo:scene">> ->
	  decode_trans_form_els(__TopXMLNS, __Opts, _els, Size,
				decode_position(<<"jabber:memo:scene">>, __Opts,
						_el));
      _ ->
	  decode_trans_form_els(__TopXMLNS, __Opts, _els, Size,
				Position)
    end;
decode_trans_form_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"size">>, _attrs, _} = _el | _els], Size,
		      Position) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:memo:scene">> ->
	  decode_trans_form_els(__TopXMLNS, __Opts, _els,
				decode_size(<<"jabber:memo:scene">>, __Opts,
					    _el),
				Position);
      _ ->
	  decode_trans_form_els(__TopXMLNS, __Opts, _els, Size,
				Position)
    end;
decode_trans_form_els(__TopXMLNS, __Opts, [_ | _els],
		      Size, Position) ->
    decode_trans_form_els(__TopXMLNS, __Opts, _els, Size,
			  Position).

encode_trans_form({trans_form, Position, Size},
		  __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:memo:scene">>, [],
				    __TopXMLNS),
    _els = lists:reverse('encode_trans_form_$size'(Size,
						   __NewTopXMLNS,
						   'encode_trans_form_$position'(Position,
										 __NewTopXMLNS,
										 []))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"trans_form">>, _attrs, _els}.

'encode_trans_form_$size'(undefined, __TopXMLNS,
			  _acc) ->
    _acc;
'encode_trans_form_$size'(Size, __TopXMLNS, _acc) ->
    [encode_size(Size, __TopXMLNS) | _acc].

'encode_trans_form_$position'(undefined, __TopXMLNS,
			      _acc) ->
    _acc;
'encode_trans_form_$position'(Position, __TopXMLNS,
			      _acc) ->
    [encode_position(Position, __TopXMLNS) | _acc].

decode_size(__TopXMLNS, __Opts,
	    {xmlel, <<"size">>, _attrs, _els}) ->
    {L, W, H} = decode_size_attrs(__TopXMLNS, _attrs,
				  undefined, undefined, undefined),
    {size, L, W, H}.

decode_size_attrs(__TopXMLNS,
		  [{<<"l">>, _val} | _attrs], _L, W, H) ->
    decode_size_attrs(__TopXMLNS, _attrs, _val, W, H);
decode_size_attrs(__TopXMLNS,
		  [{<<"w">>, _val} | _attrs], L, _W, H) ->
    decode_size_attrs(__TopXMLNS, _attrs, L, _val, H);
decode_size_attrs(__TopXMLNS,
		  [{<<"h">>, _val} | _attrs], L, W, _H) ->
    decode_size_attrs(__TopXMLNS, _attrs, L, W, _val);
decode_size_attrs(__TopXMLNS, [_ | _attrs], L, W, H) ->
    decode_size_attrs(__TopXMLNS, _attrs, L, W, H);
decode_size_attrs(__TopXMLNS, [], L, W, H) ->
    {decode_size_attr_l(__TopXMLNS, L),
     decode_size_attr_w(__TopXMLNS, W),
     decode_size_attr_h(__TopXMLNS, H)}.

encode_size({size, L, W, H}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:memo:scene">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = encode_size_attr_h(H,
				encode_size_attr_w(W,
						   encode_size_attr_l(L,
								      xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
												 __TopXMLNS)))),
    {xmlel, <<"size">>, _attrs, _els}.

decode_size_attr_l(__TopXMLNS, undefined) -> <<>>;
decode_size_attr_l(__TopXMLNS, _val) -> _val.

encode_size_attr_l(<<>>, _acc) -> _acc;
encode_size_attr_l(_val, _acc) ->
    [{<<"l">>, _val} | _acc].

decode_size_attr_w(__TopXMLNS, undefined) -> <<>>;
decode_size_attr_w(__TopXMLNS, _val) -> _val.

encode_size_attr_w(<<>>, _acc) -> _acc;
encode_size_attr_w(_val, _acc) ->
    [{<<"w">>, _val} | _acc].

decode_size_attr_h(__TopXMLNS, undefined) -> <<>>;
decode_size_attr_h(__TopXMLNS, _val) -> _val.

encode_size_attr_h(<<>>, _acc) -> _acc;
encode_size_attr_h(_val, _acc) ->
    [{<<"h">>, _val} | _acc].

decode_position(__TopXMLNS, __Opts,
		{xmlel, <<"position">>, _attrs, _els}) ->
    {X, Y, Z} = decode_position_attrs(__TopXMLNS, _attrs,
				      undefined, undefined, undefined),
    {position, X, Y, Z}.

decode_position_attrs(__TopXMLNS,
		      [{<<"x">>, _val} | _attrs], _X, Y, Z) ->
    decode_position_attrs(__TopXMLNS, _attrs, _val, Y, Z);
decode_position_attrs(__TopXMLNS,
		      [{<<"y">>, _val} | _attrs], X, _Y, Z) ->
    decode_position_attrs(__TopXMLNS, _attrs, X, _val, Z);
decode_position_attrs(__TopXMLNS,
		      [{<<"z">>, _val} | _attrs], X, Y, _Z) ->
    decode_position_attrs(__TopXMLNS, _attrs, X, Y, _val);
decode_position_attrs(__TopXMLNS, [_ | _attrs], X, Y,
		      Z) ->
    decode_position_attrs(__TopXMLNS, _attrs, X, Y, Z);
decode_position_attrs(__TopXMLNS, [], X, Y, Z) ->
    {decode_position_attr_x(__TopXMLNS, X),
     decode_position_attr_y(__TopXMLNS, Y),
     decode_position_attr_z(__TopXMLNS, Z)}.

encode_position({position, X, Y, Z}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:memo:scene">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = encode_position_attr_z(Z,
				    encode_position_attr_y(Y,
							   encode_position_attr_x(X,
										  xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
													     __TopXMLNS)))),
    {xmlel, <<"position">>, _attrs, _els}.

decode_position_attr_x(__TopXMLNS, undefined) -> <<>>;
decode_position_attr_x(__TopXMLNS, _val) -> _val.

encode_position_attr_x(<<>>, _acc) -> _acc;
encode_position_attr_x(_val, _acc) ->
    [{<<"x">>, _val} | _acc].

decode_position_attr_y(__TopXMLNS, undefined) -> <<>>;
decode_position_attr_y(__TopXMLNS, _val) -> _val.

encode_position_attr_y(<<>>, _acc) -> _acc;
encode_position_attr_y(_val, _acc) ->
    [{<<"y">>, _val} | _acc].

decode_position_attr_z(__TopXMLNS, undefined) -> <<>>;
decode_position_attr_z(__TopXMLNS, _val) -> _val.

encode_position_attr_z(<<>>, _acc) -> _acc;
encode_position_attr_z(_val, _acc) ->
    [{<<"z">>, _val} | _acc].
