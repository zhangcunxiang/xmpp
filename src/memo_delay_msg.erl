%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(memo_delay_msg).

-compile(export_all).

do_decode(<<"memo_delay_msg">>, <<"jabber:memo:delay">>,
	  El, Opts) ->
    decode_memo_delay_msg(<<"jabber:memo:delay">>, Opts,
			  El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"memo_delay_msg">>, <<"jabber:memo:delay">>}].

do_encode({memo_delay_msg, _, _, _, _, _, _} =
	      Memo_delay_msg,
	  TopXMLNS) ->
    encode_memo_delay_msg(Memo_delay_msg, TopXMLNS).

do_get_name({memo_delay_msg, _, _, _, _, _, _}) ->
    <<"memo_delay_msg">>.

do_get_ns({memo_delay_msg, _, _, _, _, _, _}) ->
    <<"jabber:memo:delay">>.

pp(memo_delay_msg, 6) ->
    [msg_id, packet, send_time, delay_seconds, time_ref,
     state];
pp(_, _) -> no.

records() -> [{memo_delay_msg, 6}].

decode_memo_delay_msg(__TopXMLNS, __Opts,
		      {xmlel, <<"memo_delay_msg">>, _attrs, _els}) ->
    {Msg_id, Packet, Send_time, Delay_seconds, Time_ref,
     State} =
	decode_memo_delay_msg_attrs(__TopXMLNS, _attrs,
				    undefined, undefined, undefined, undefined,
				    undefined, undefined),
    {memo_delay_msg, Msg_id, Packet, Send_time,
     Delay_seconds, Time_ref, State}.

decode_memo_delay_msg_attrs(__TopXMLNS,
			    [{<<"msg_id">>, _val} | _attrs], _Msg_id, Packet,
			    Send_time, Delay_seconds, Time_ref, State) ->
    decode_memo_delay_msg_attrs(__TopXMLNS, _attrs, _val,
				Packet, Send_time, Delay_seconds, Time_ref,
				State);
decode_memo_delay_msg_attrs(__TopXMLNS,
			    [{<<"packet">>, _val} | _attrs], Msg_id, _Packet,
			    Send_time, Delay_seconds, Time_ref, State) ->
    decode_memo_delay_msg_attrs(__TopXMLNS, _attrs, Msg_id,
				_val, Send_time, Delay_seconds, Time_ref,
				State);
decode_memo_delay_msg_attrs(__TopXMLNS,
			    [{<<"send_time">>, _val} | _attrs], Msg_id, Packet,
			    _Send_time, Delay_seconds, Time_ref, State) ->
    decode_memo_delay_msg_attrs(__TopXMLNS, _attrs, Msg_id,
				Packet, _val, Delay_seconds, Time_ref, State);
decode_memo_delay_msg_attrs(__TopXMLNS,
			    [{<<"delay_seconds">>, _val} | _attrs], Msg_id,
			    Packet, Send_time, _Delay_seconds, Time_ref,
			    State) ->
    decode_memo_delay_msg_attrs(__TopXMLNS, _attrs, Msg_id,
				Packet, Send_time, _val, Time_ref, State);
decode_memo_delay_msg_attrs(__TopXMLNS,
			    [{<<"time_ref">>, _val} | _attrs], Msg_id, Packet,
			    Send_time, Delay_seconds, _Time_ref, State) ->
    decode_memo_delay_msg_attrs(__TopXMLNS, _attrs, Msg_id,
				Packet, Send_time, Delay_seconds, _val, State);
decode_memo_delay_msg_attrs(__TopXMLNS,
			    [{<<"state">>, _val} | _attrs], Msg_id, Packet,
			    Send_time, Delay_seconds, Time_ref, _State) ->
    decode_memo_delay_msg_attrs(__TopXMLNS, _attrs, Msg_id,
				Packet, Send_time, Delay_seconds, Time_ref,
				_val);
decode_memo_delay_msg_attrs(__TopXMLNS, [_ | _attrs],
			    Msg_id, Packet, Send_time, Delay_seconds, Time_ref,
			    State) ->
    decode_memo_delay_msg_attrs(__TopXMLNS, _attrs, Msg_id,
				Packet, Send_time, Delay_seconds, Time_ref,
				State);
decode_memo_delay_msg_attrs(__TopXMLNS, [], Msg_id,
			    Packet, Send_time, Delay_seconds, Time_ref,
			    State) ->
    {decode_memo_delay_msg_attr_msg_id(__TopXMLNS, Msg_id),
     decode_memo_delay_msg_attr_packet(__TopXMLNS, Packet),
     decode_memo_delay_msg_attr_send_time(__TopXMLNS,
					  Send_time),
     decode_memo_delay_msg_attr_delay_seconds(__TopXMLNS,
					      Delay_seconds),
     decode_memo_delay_msg_attr_time_ref(__TopXMLNS,
					 Time_ref),
     decode_memo_delay_msg_attr_state(__TopXMLNS, State)}.

encode_memo_delay_msg({memo_delay_msg, Msg_id, Packet,
		       Send_time, Delay_seconds, Time_ref, State},
		      __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"jabber:memo:delay">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = encode_memo_delay_msg_attr_state(State,
					      encode_memo_delay_msg_attr_time_ref(Time_ref,
										  encode_memo_delay_msg_attr_delay_seconds(Delay_seconds,
															   encode_memo_delay_msg_attr_send_time(Send_time,
																				encode_memo_delay_msg_attr_packet(Packet,
																								  encode_memo_delay_msg_attr_msg_id(Msg_id,
																												    xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																															       __TopXMLNS))))))),
    {xmlel, <<"memo_delay_msg">>, _attrs, _els}.

decode_memo_delay_msg_attr_msg_id(__TopXMLNS,
				  undefined) ->
    <<>>;
decode_memo_delay_msg_attr_msg_id(__TopXMLNS, _val) ->
    _val.

encode_memo_delay_msg_attr_msg_id(<<>>, _acc) -> _acc;
encode_memo_delay_msg_attr_msg_id(_val, _acc) ->
    [{<<"msg_id">>, _val} | _acc].

decode_memo_delay_msg_attr_packet(__TopXMLNS,
				  undefined) ->
    <<>>;
decode_memo_delay_msg_attr_packet(__TopXMLNS, _val) ->
    _val.

encode_memo_delay_msg_attr_packet(<<>>, _acc) -> _acc;
encode_memo_delay_msg_attr_packet(_val, _acc) ->
    [{<<"packet">>, _val} | _acc].

decode_memo_delay_msg_attr_send_time(__TopXMLNS,
				     undefined) ->
    <<>>;
decode_memo_delay_msg_attr_send_time(__TopXMLNS,
				     _val) ->
    _val.

encode_memo_delay_msg_attr_send_time(<<>>, _acc) ->
    _acc;
encode_memo_delay_msg_attr_send_time(_val, _acc) ->
    [{<<"send_time">>, _val} | _acc].

decode_memo_delay_msg_attr_delay_seconds(__TopXMLNS,
					 undefined) ->
    <<>>;
decode_memo_delay_msg_attr_delay_seconds(__TopXMLNS,
					 _val) ->
    _val.

encode_memo_delay_msg_attr_delay_seconds(<<>>, _acc) ->
    _acc;
encode_memo_delay_msg_attr_delay_seconds(_val, _acc) ->
    [{<<"delay_seconds">>, _val} | _acc].

decode_memo_delay_msg_attr_time_ref(__TopXMLNS,
				    undefined) ->
    <<>>;
decode_memo_delay_msg_attr_time_ref(__TopXMLNS, _val) ->
    _val.

encode_memo_delay_msg_attr_time_ref(<<>>, _acc) -> _acc;
encode_memo_delay_msg_attr_time_ref(_val, _acc) ->
    [{<<"time_ref">>, _val} | _acc].

decode_memo_delay_msg_attr_state(__TopXMLNS,
				 undefined) ->
    <<>>;
decode_memo_delay_msg_attr_state(__TopXMLNS, _val) ->
    _val.

encode_memo_delay_msg_attr_state(<<>>, _acc) -> _acc;
encode_memo_delay_msg_attr_state(_val, _acc) ->
    [{<<"state">>, _val} | _acc].
