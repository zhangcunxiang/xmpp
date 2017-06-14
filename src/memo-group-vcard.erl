%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module('memo-group-vcard').

-compile(export_all).

do_decode(<<"PHOTO">>, <<"group-vcard-temp">>, El,
	  Opts) ->
    decode_group_vcard_PHOTO(<<"group-vcard-temp">>, Opts,
			     El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() -> [{<<"PHOTO">>, <<"group-vcard-temp">>}].

do_encode({group_vcard_photo, _, _} = Photo,
	  TopXMLNS) ->
    encode_group_vcard_PHOTO(Photo, TopXMLNS).

do_get_name({group_vcard_photo, _, _}) -> <<"PHOTO">>.

do_get_ns({group_vcard_photo, _, _}) ->
    <<"group-vcard-temp">>.

pp(group_vcard_photo, 2) -> [type, photo];
pp(_, _) -> no.

records() -> [{group_vcard_photo, 2}].

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
				       memo_group_vcard:decode_group_vcard_BINVAL(<<"group-vcard-temp">>,
										  __Opts,
										  _el));
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
				       memo_group_vcard:decode_group_vcard_TYPE(<<"group-vcard-temp">>,
										__Opts,
										_el),
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
    [memo_group_vcard:encode_group_vcard_TYPE(Type,
					      __TopXMLNS)
     | _acc].

'encode_group_vcard_PHOTO_$photo'(undefined, __TopXMLNS,
				  _acc) ->
    _acc;
'encode_group_vcard_PHOTO_$photo'(Photo, __TopXMLNS,
				  _acc) ->
    [memo_group_vcard:encode_group_vcard_BINVAL(Photo,
						__TopXMLNS)
     | _acc].
