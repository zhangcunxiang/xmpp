%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(memo_xep_scene_list).

-compile(export_all).

do_decode(<<"query">>, <<"jabber:memo:scene:list">>, El,
	  Opts) ->
    decode_memo_scene_list(<<"jabber:memo:scene:list">>,
			   Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() -> [{<<"query">>, <<"jabber:memo:scene:list">>}].

do_encode({memo_scene_list, _, _} = Query, TopXMLNS) ->
    encode_memo_scene_list(Query, TopXMLNS).

do_get_name({memo_scene_list, _, _}) -> <<"query">>.

do_get_ns({memo_scene_list, _, _}) ->
    <<"jabber:memo:scene:list">>.

pp(memo_scene_list, 2) -> [role, memo_scene];
pp(_, _) -> no.

records() -> [{memo_scene_list, 2}].

decode_memo_scene_list(__TopXMLNS, __Opts,
		       {xmlel, <<"query">>, _attrs, _els}) ->
    Memo_scene = decode_memo_scene_list_els(__TopXMLNS,
					    __Opts, _els, []),
    Role = decode_memo_scene_list_attrs(__TopXMLNS, _attrs,
					undefined),
    {memo_scene_list, Role, Memo_scene}.

decode_memo_scene_list_els(__TopXMLNS, __Opts, [],
			   Memo_scene) ->
    lists:reverse(Memo_scene);
decode_memo_scene_list_els(__TopXMLNS, __Opts,
			   [{xmlel, <<"query">>, _attrs, _} = _el | _els],
			   Memo_scene) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"jabber:memo:scene">> ->
	  decode_memo_scene_list_els(__TopXMLNS, __Opts, _els,
				     [memo_xep_scene:decode_memo_scene(<<"jabber:memo:scene">>,
								       __Opts,
								       _el)
				      | Memo_scene]);
      _ ->
	  decode_memo_scene_list_els(__TopXMLNS, __Opts, _els,
				     Memo_scene)
    end;
decode_memo_scene_list_els(__TopXMLNS, __Opts,
			   [_ | _els], Memo_scene) ->
    decode_memo_scene_list_els(__TopXMLNS, __Opts, _els,
			       Memo_scene).

decode_memo_scene_list_attrs(__TopXMLNS,
			     [{<<"role">>, _val} | _attrs], _Role) ->
    decode_memo_scene_list_attrs(__TopXMLNS, _attrs, _val);
decode_memo_scene_list_attrs(__TopXMLNS, [_ | _attrs],
			     Role) ->
    decode_memo_scene_list_attrs(__TopXMLNS, _attrs, Role);
decode_memo_scene_list_attrs(__TopXMLNS, [], Role) ->
    decode_memo_scene_list_attr_role(__TopXMLNS, Role).

encode_memo_scene_list({memo_scene_list, Role,
			Memo_scene},
		       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:memo:scene:list">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_memo_scene_list_$memo_scene'(Memo_scene,
							   __NewTopXMLNS, [])),
    _attrs = encode_memo_scene_list_attr_role(Role,
					      xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									 __TopXMLNS)),
    {xmlel, <<"query">>, _attrs, _els}.

'encode_memo_scene_list_$memo_scene'([], __TopXMLNS,
				     _acc) ->
    _acc;
'encode_memo_scene_list_$memo_scene'([Memo_scene
				      | _els],
				     __TopXMLNS, _acc) ->
    'encode_memo_scene_list_$memo_scene'(_els, __TopXMLNS,
					 [memo_xep_scene:encode_memo_scene(Memo_scene,
									   __TopXMLNS)
					  | _acc]).

decode_memo_scene_list_attr_role(__TopXMLNS,
				 undefined) ->
    <<>>;
decode_memo_scene_list_attr_role(__TopXMLNS, _val) ->
    _val.

encode_memo_scene_list_attr_role(<<>>, _acc) -> _acc;
encode_memo_scene_list_attr_role(_val, _acc) ->
    [{<<"role">>, _val} | _acc].
