%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(memo_xep_gateway).

-compile(export_all).

do_decode(<<"query">>, <<"jabber:iq:memo:gateway">>, El,
	  Opts) ->
    decode_mod_gateway(<<"jabber:iq:memo:gateway">>, Opts,
		       El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() -> [{<<"query">>, <<"jabber:iq:memo:gateway">>}].

do_encode({mod_gateway, _, _, _, _} = Query,
	  TopXMLNS) ->
    encode_mod_gateway(Query, TopXMLNS).

do_get_name({mod_gateway, _, _, _, _}) -> <<"query">>.

do_get_ns({mod_gateway, _, _, _, _}) ->
    <<"jabber:iq:memo:gateway">>.

pp(mod_gateway, 4) ->
    [device_id, device_type, device_name, property];
pp(_, _) -> no.

records() -> [{mod_gateway, 4}].

decode_mod_gateway(__TopXMLNS, __Opts,
		   {xmlel, <<"query">>, _attrs, _els}) ->
    {Device_id, Device_type, Device_name, Property} =
	decode_mod_gateway_attrs(__TopXMLNS, _attrs, undefined,
				 undefined, undefined, undefined),
    {mod_gateway, Device_id, Device_type, Device_name,
     Property}.

decode_mod_gateway_attrs(__TopXMLNS,
			 [{<<"device_id">>, _val} | _attrs], _Device_id,
			 Device_type, Device_name, Property) ->
    decode_mod_gateway_attrs(__TopXMLNS, _attrs, _val,
			     Device_type, Device_name, Property);
decode_mod_gateway_attrs(__TopXMLNS,
			 [{<<"device_type">>, _val} | _attrs], Device_id,
			 _Device_type, Device_name, Property) ->
    decode_mod_gateway_attrs(__TopXMLNS, _attrs, Device_id,
			     _val, Device_name, Property);
decode_mod_gateway_attrs(__TopXMLNS,
			 [{<<"device_name">>, _val} | _attrs], Device_id,
			 Device_type, _Device_name, Property) ->
    decode_mod_gateway_attrs(__TopXMLNS, _attrs, Device_id,
			     Device_type, _val, Property);
decode_mod_gateway_attrs(__TopXMLNS,
			 [{<<"property">>, _val} | _attrs], Device_id,
			 Device_type, Device_name, _Property) ->
    decode_mod_gateway_attrs(__TopXMLNS, _attrs, Device_id,
			     Device_type, Device_name, _val);
decode_mod_gateway_attrs(__TopXMLNS, [_ | _attrs],
			 Device_id, Device_type, Device_name, Property) ->
    decode_mod_gateway_attrs(__TopXMLNS, _attrs, Device_id,
			     Device_type, Device_name, Property);
decode_mod_gateway_attrs(__TopXMLNS, [], Device_id,
			 Device_type, Device_name, Property) ->
    {decode_mod_gateway_attr_device_id(__TopXMLNS,
				       Device_id),
     decode_mod_gateway_attr_device_type(__TopXMLNS,
					 Device_type),
     decode_mod_gateway_attr_device_name(__TopXMLNS,
					 Device_name),
     decode_mod_gateway_attr_property(__TopXMLNS, Property)}.

encode_mod_gateway({mod_gateway, Device_id, Device_type,
		    Device_name, Property},
		   __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:iq:memo:gateway">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_mod_gateway_attr_property(Property,
					      encode_mod_gateway_attr_device_name(Device_name,
										  encode_mod_gateway_attr_device_type(Device_type,
														      encode_mod_gateway_attr_device_id(Device_id,
																			xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																						   __TopXMLNS))))),
    {xmlel, <<"query">>, _attrs, _els}.

decode_mod_gateway_attr_device_id(__TopXMLNS,
				  undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"device_id">>, <<"query">>,
		   __TopXMLNS}});
decode_mod_gateway_attr_device_id(__TopXMLNS, _val) ->
    _val.

encode_mod_gateway_attr_device_id(_val, _acc) ->
    [{<<"device_id">>, _val} | _acc].

decode_mod_gateway_attr_device_type(__TopXMLNS,
				    undefined) ->
    <<>>;
decode_mod_gateway_attr_device_type(__TopXMLNS, _val) ->
    _val.

encode_mod_gateway_attr_device_type(<<>>, _acc) -> _acc;
encode_mod_gateway_attr_device_type(_val, _acc) ->
    [{<<"device_type">>, _val} | _acc].

decode_mod_gateway_attr_device_name(__TopXMLNS,
				    undefined) ->
    <<>>;
decode_mod_gateway_attr_device_name(__TopXMLNS, _val) ->
    _val.

encode_mod_gateway_attr_device_name(<<>>, _acc) -> _acc;
encode_mod_gateway_attr_device_name(_val, _acc) ->
    [{<<"device_name">>, _val} | _acc].

decode_mod_gateway_attr_property(__TopXMLNS,
				 undefined) ->
    <<>>;
decode_mod_gateway_attr_property(__TopXMLNS, _val) ->
    _val.

encode_mod_gateway_attr_property(<<>>, _acc) -> _acc;
encode_mod_gateway_attr_property(_val, _acc) ->
    [{<<"property">>, _val} | _acc].
